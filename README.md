# AWS Infrastructure for E-commerce Store

This repository contains Terraform code to quickly deploy AWS infrastructure for an e-commerce store. Please note that this Terraform code only provisions the basic infrastructure, and further configuration will be necessary to set up the actual e-commerce application.

## Usage

1. **Install Terraform**: Ensure you have Terraform installed on your local machine.
2. **Clone the Repository**: Clone this repository to your local machine.
3. **Configure Variables**: Update variables in `variables.tf` according to your requirements.
4. **Initialize Terraform**: Run `terraform init` to initialize Terraform and download necessary plugins.
5. **Review and Apply Changes**: Run `terraform plan` to review the execution plan, then run `terraform apply` to apply the changes and provision the infrastructure.
6. **Access Resources**: Once the deployment is complete, further configuration will be needed to set up the e-commerce application using the provisioned resources.

## Examples

Here are some example use cases for this infrastructure:

- **VPC (Virtual Private Cloud)**: Provides isolated networking environment for the e-commerce application.
- **EC2 Instance for WordPress**: A server instance to host the WordPress platform for building the e-commerce website. The provided AMI has WordPress pre-installed. More information about the AMI and its configuration can be found [here](https://docs.bitnami.com/aws/apps/wordpress-pro/).
- **RDS Database**: Managed relational database service for storing e-commerce data securely.
- **S3 Bucket for Media Files**: Storage solution for storing media files such as product images.
- **ElastiCache Cluster for Caching**: Provides caching capabilities to improve performance of the e-commerce application.
- **Backup Configurations**: Configures backup plans for EC2 instance and RDS database to ensure data durability.

## Security and Practicality Considerations

- **Security Groups**: Ensure that security group configurations are tailored to your specific security requirements.
- **Sensitive Information**: Avoid storing sensitive information like passwords directly in Terraform files. Instead, use secure solutions like AWS Secrets Manager.
- **Tagging**: Make sure to tag all resources appropriately for better management and tracking.
- **Free Tier Eligibility**: The variables have been chosen with AWS Free Tier eligibility in mind, so you can test the code within the Free Tier limits.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
