provider "aws" {
  region = var.aws_region
}

# Define a Virtual Private Cloud (VPC)
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Define an internet gateway for the VPC
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Define a route table for the VPC
resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Associate the main route table with the main subnet
resource "aws_route_table_association" "main_subnet_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_route_table.id
}

# Define a subnet for the VPC
resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = var.enable_public_ip

  tags = {
    Name = var.subnet_name
  }
}

# Define a security group for the EC2 instance
resource "aws_security_group" "web_sg" {
  vpc_id      = aws_vpc.main_vpc.id
  name        = var.security_group_name
  description = "Security group for web servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define an EC2 instance for WordPress
resource "aws_instance" "wordpress_instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name = "wordpress_instance"
  }
}

# Define an RDS database instance for WordPress
resource "aws_db_instance" "wordpress_db" {
  allocated_storage   = var.db_allocated_storage
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  identifier          = var.db_name
  instance_class      = var.db_instance_class
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = var.db_publicly_accessible

  tags = {
    Name = "wordpress_db"
  }
}

# Define an S3 bucket for storing media files with ACL
resource "aws_s3_bucket" "media_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "media_bucket"
  }
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.media_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "media_bucket_acl" {
  bucket = aws_s3_bucket.media_bucket.id
  acl    = var.s3_bucket_acl
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

# Define an ElastiCache cluster for caching
resource "aws_elasticache_cluster" "cache_cluster" {
  cluster_id           = var.cache_cluster_id
  engine               = var.cache_engine
  node_type            = var.cache_node_type
  num_cache_nodes      = var.cache_num_nodes
  parameter_group_name = var.cache_parameter_group
  port                 = var.cache_port

  tags = {
    Name = "cache_cluster"
  }
}

# Define a backup vault
resource "aws_backup_vault" "backup_vault" {
  name = var.backup_vault_name

  tags = {
    Name = "backup_vault"
  }
}

# Define a backup plan for EC2 instance
resource "aws_backup_plan" "ec2_backup_plan" {
  name             = var.backup_plan_name

  rule {
    rule_name           = var.backup_rule_name
    target_vault_name   = aws_backup_vault.backup_vault.name
    schedule            = var.backup_schedule
  }
}

# Output resources for future reference
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "instance_public_ip" {
  value = aws_instance.wordpress_instance.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.media_bucket.arn
}

output "cache_cluster_address" {
  value = aws_elasticache_cluster.cache_cluster.cache_nodes.0.address
}

output "backup_vault_arn" {
  value = aws_backup_vault.backup_vault.arn
}
