# main.tf

provider "aws" {
  region = var.aws_region
}

# Define a Virtual Private Cloud (VPC)
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
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

  # Security rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add other security rules as needed, e.g., SSH, HTTPS, etc.
}

# Define an EC2 instance for WordPress
resource "aws_instance" "wordpress_instance" {
  ami                = var.instance_ami
  instance_type      = var.instance_type
  subnet_id          = aws_subnet.main_subnet.id
  security_group_ids = [aws_security_group.web_sg.id]

  # Other configurations such as SSH key, EIP, tags, etc.
}

# Define an RDS database instance for WordPress
resource "aws_db_instance" "wordpress_db" {
  allocated_storage   = var.db_allocated_storage
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  name                = var.db_name
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = var.db_publicly_accessible

  # Other configurations such as database parameters, tags, etc.
}

# Define an S3 bucket for storing media files
resource "aws_s3_bucket" "media_bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl

  # Other configurations such as access logging, versioning, encryption, etc.
}

# Define an ElastiCache cluster for caching
resource "aws_elasticache_cluster" "cache_cluster" {
  cluster_id           = var.cache_cluster_id
  engine               = var.cache_engine
  node_type            = var.cache_node_type
  num_cache_nodes      = var.cache_num_nodes
  parameter_group_name = var.cache_parameter_group
  port                 = var.cache_port

  # Other configurations such as security group, tags, etc.
}

# Define a backup plan for EC2 instance
resource "aws_backup_plan" "ec2_backup_plan" {
  name = var.backup_plan_name
  rule {
    rule_name         = var.backup_rule_name
    target_vault_name = var.backup_vault_name
    schedule          = var.backup_schedule
    lifecycle {
      delete_after_days = var.backup_delete_after_days
    }
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
  value = aws_elasticache_cluster.cache_cluster.address
}
