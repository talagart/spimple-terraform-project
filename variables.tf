# AWS Region where resources will be provisioned
variable "aws_region" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "eu-west-2"  # Zmiana na region eu-west-2
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Możesz zmienić domyślny blok CIDR, jeśli to konieczne
}

# VPC name
variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "main_vpc"  # Możesz zmienić domyślną nazwę, jeśli to konieczne
}

# Subnet CIDR block
variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"  # Możesz zmienić domyślny blok CIDR, jeśli to konieczne
}

# Subnet availability zone
variable "subnet_az" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "eu-west-2a"  # Zmiana na AZ w regionie eu-west-2
}

# Enable public IP for instances in the subnet
variable "enable_public_ip" {
  description = "Whether to enable public IP for instances in the subnet"
  type        = bool
  default     = true  # Możesz zmienić domyślne ustawienie, jeśli to konieczne
}

# Instance AMI (Amazon Machine Image)
variable "instance_ami" {
  description = "The AMI for the EC2 instance"
  type        = string
  default     = "ami-073f9b5191a13061b"  # Aktualizacja AMI
}

# Instance type for EC2 instance
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"  # AWS Free Tier-eligible
}

# Security group name
variable "security_group_name" {
  description = "The name tag for the security group"
  type        = string
  default     = "web_sg"  # Możesz zmienić domyślną nazwę, jeśli to konieczne
}

# DB Engine (e.g., mysql)
variable "db_engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"  # MySQL is Free Tier-eligible
}

# DB Engine Version
variable "db_engine_version" {
  description = "The database engine version"
  type        = string
  default     = "8.0.35"  # Kompatybilna wersja
}

# DB Name
variable "db_name" {
  description = "The name for the RDS database"
  type        = string
  default     = "wordpress-db"  # Możesz zmienić domyślną nazwę bazy danych, jeśli to konieczne
}

# DB Username
variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  default     = "admin"  # Możesz zmienić domyślną nazwę użytkownika, jeśli to konieczne
}

# DB Password
variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  default     = "ChangeMe123!"  # Możesz zmienić domyślne hasło, jeśli to konieczne
}

# Whether the RDS database is publicly accessible
variable "db_publicly_accessible" {
  description = "Whether the RDS database is publicly accessible"
  type        = bool
  default     = false  # Możesz zmienić domyślne ustawienie, jeśli to konieczne
}

# S3 Bucket Name
variable "s3_bucket_name" {
  description = "The name for the S3 bucket"
  type        = string
  default     = "unique-s3-bucket-name-1992"  # Możesz zmienić domyślną nazwę koszyka, jeśli to konieczne
}

# S3 Bucket ACL
variable "s3_bucket_acl" {
  description = "The access control list (ACL) for the S3 bucket"
  type        = string
  default     = "private"  # Możesz zmienić domyślny ACL, jeśli to konieczne
}

# ElastiCache Cluster ID
variable "cache_cluster_id" {
  description = "The ID for the ElastiCache cluster"
  type        = string
  default     = "your-cache-cluster-id"  # Możesz zmienić domyślny ID klastra, jeśli to konieczne
}

# ElastiCache Engine (e.g., redis)
variable "cache_engine" {
  description = "The caching engine"
  type        = string
  default     = "redis"  # Redis is Free Tier-eligible
}

# ElastiCache Node Type
variable "cache_node_type" {
  description = "The node type for the ElastiCache cluster"
  type        = string
  default     = "cache.t2.micro"  # AWS Free Tier-eligible
}

# Number of Nodes for the ElastiCache cluster
variable "cache_num_nodes" {
  description = "The number of nodes for the ElastiCache cluster"
  type        = number
  default     = 1  # Single node cluster is Free Tier-eligible
}

# Parameter group name for ElastiCache cluster
variable "cache_parameter_group" {
  description = "The parameter group name for the ElastiCache cluster"
  type        = string
  default     = "default.redis7"
}

# Port for ElastiCache cluster
variable "cache_port" {
  description = "The port for the ElastiCache cluster"
  type        = number
  default     = 6379  # Domyślny port dla Redis
}

# Backup Plan Name
variable "backup_plan_name" {
  description = "The name for the backup plan"
  type        = string
  default     = "your-backup-plan-name"  # Możesz zmienić domyślną nazwę planu kopii zapasowej, jeśli to konieczne
}

# Backup Rule Name
variable "backup_rule_name" {
  description = "The name for the backup rule"
  type        = string
  default     = "your-backup-rule-name"  # Możesz zmienić domyślną nazwę reguły kopii zapasowej, jeśli to konieczne
}

# Backup Vault Name
variable "backup_vault_name" {
  description = "The name for the backup vault"
  type        = string
  default     = "your-backup-vault-name"  # Możesz zmienić domyślną nazwę skarbca kopii zapasowej, jeśli to konieczne
}

# Backup Schedule
variable "backup_schedule" {
  description = "The schedule for backups"
  type        = string
  default     = "cron(0 12 * * ? *)"  # Codzienne kopie zapasowe o 12:00 UTC
}

# Backup Delete After Days
variable "backup_delete_after_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 30  # Możesz zmienić domyślny okres przechowywania, jeśli to konieczne
}

# Internet Gateway name
variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type        = string
  default     = "main_igw"  # Możesz zmienić domyślną nazwę, jeśli to konieczne
}

# Subnet name
variable "subnet_name" {
  description = "The name tag for the subnet"
  type        = string
  default     = "main_subnet"  # Możesz zmienić domyślną nazwę, jeśli to konieczne
}

# Allocated storage for RDS database
variable "db_allocated_storage" {
  description = "The allocated storage for the RDS database"
  type        = number
  default     = 20  # Możesz zmienić domyślną przydzieloną przestrzeń dyskową, jeśli to konieczne
}

# Instance class for RDS database
variable "db_instance_class" {
  description = "The instance class for the RDS database"
  type        = string
  default     = "db.t3.micro"  # AWS Free Tier-eligible
}

# Route Table name
variable "route_table_name" {
  description = "The name tag for the route table"
  type        = string
  default     = "main_route_table"
}