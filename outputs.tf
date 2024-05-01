# outputs.tf

# This file defines output values that can be useful for retrieving information about
# the provisioned infrastructure after Terraform applies the configuration.

# Output for the VPC ID
output "vpc_id" {
  description = "The ID of the provisioned VPC"
  value       = aws_vpc.main.id
}

# Output for the Subnet ID
output "subnet_id" {
  description = "The ID of the provisioned subnet"
  value       = aws_subnet.main.id
}

# Output for the Security Group ID
output "security_group_id" {
  description = "The ID of the provisioned security group"
  value       = aws_security_group.web.id
}

# Output for the RDS Endpoint
output "rds_endpoint" {
  description = "The endpoint of the provisioned RDS database"
  value       = aws_db_instance.main.endpoint
}

# Output for the S3 Bucket ARN
output "s3_bucket_arn" {
  description = "The ARN of the provisioned S3 bucket"
  value       = aws_s3_bucket.main.arn
}

# Output for the ElastiCache Cluster Endpoint
output "cache_cluster_endpoint" {
  description = "The endpoint of the provisioned ElastiCache cluster"
  value       = aws_elasticache_cluster.main.cache_nodes.0.endpoint
}

# Output for the Backup Vault ARN
output "backup_vault_arn" {
  description = "The ARN of the provisioned backup vault"
  value       = aws_backup_vault.main.arn
}

# Output for the EC2 Instance Public IP
output "ec2_public_ip" {
  description = "The public IP address of the provisioned EC2 instance"
  value       = aws_instance.web.public_ip
}

# Output for the EC2 Instance Public DNS
output "ec2_public_dns" {
  description = "The public DNS name of the provisioned EC2 instance"
  value       = aws_instance.web.public_dns
}

# Output for the ElastiCache Cluster Configuration Endpoint
output "cache_cluster_config_endpoint" {
  description = "The configuration endpoint of the provisioned ElastiCache cluster"
  value       = aws_elasticache_cluster.main.configuration_endpoint
}

# Output for the Backup Plan ID
output "backup_plan_id" {
  description = "The ID of the provisioned backup plan"
  value       = aws_backup_plan.main.id
}
