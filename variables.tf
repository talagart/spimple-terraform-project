# variables.tf

# This file defines input variables that can be used to customize the Terraform configuration.

# AWS Region where resources will be provisioned
variable "aws_region" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-1"  # You can change the default region as needed
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # You can change the default CIDR block as needed
}

# VPC name
variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "main_vpc"  # You can change the default name as needed
}

# Subnet CIDR block
variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"  # You can change the default CIDR block as needed
}

# Subnet availability zone
variable "subnet_az" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-east-1a"  # You can change the default availability zone as needed
}

# Enable public IP for instances in the subnet
variable "enable_public_ip" {
  description = "Whether to enable public IP for instances in the subnet"
  type        = bool
  default     = true  # You can change the default setting as needed
}

# Instance AMI (Amazon Machine Image)
variable "instance_ami" {
  description = "The AMI for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (HVM), SSD Volume Type
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
  default     = "web_sg"  # You can change the default name as needed
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
  default     = "5.7"  # MySQL 5.7 is Free Tier-eligible
}

# DB Name
variable "db_name" {
  description = "The name for the RDS database"
  type        = string
  default     = "wordpress_db"  # You can change the default database name as needed
}

# DB Username
variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  default     = "admin"  # You can change the default database username as needed
}

# DB Password
variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  default     = "ChangeMe123!"  # You can change the default database password as needed
}

# Whether the RDS database is publicly accessible
variable "db_publicly_accessible" {
  description = "Whether the RDS database is publicly accessible"
  type        = bool
  default     = false  # You can change the default setting as needed
}

# S3 Bucket Name
variable "s3_bucket_name" {
  description = "The name for the S3 bucket"
  type        = string
  default     = "your-s3-bucket-name"  # You can change the default bucket name as needed
}

# ElastiCache Cluster ID
variable "cache_cluster_id" {
  description = "The ID for the ElastiCache cluster"
  type        = string
  default     = "your-cache-cluster-id"  # You can change the default cluster ID as needed
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

# Backup Plan Name
variable "backup_plan_name" {
  description = "The name for the backup plan"
  type        = string
  default     = "your-backup-plan-name"  # You can change the default backup plan name as needed
}

# Backup Rule Name
variable "backup_rule_name" {
  description = "The name for the backup rule"
  type        = string
  default     = "your-backup-rule-name"  # You can change the default backup rule name as needed
}

# Backup Vault Name
variable "backup_vault_name" {
  description = "The name for the backup vault"
  type        = string
  default     = "your-backup-vault-name"  # You can change the default backup vault name as needed
}

# Backup Schedule
variable "backup_schedule" {
  description = "The schedule for backups"
  type        = string
  default     = "cron(0 12 * * ? *)"  # Daily backups at 12:00 UTC
}

# Backup Delete After Days
variable "backup_delete_after_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 30  # You can change the default retention period as needed
}
