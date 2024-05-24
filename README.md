# Simple Terraform Project

## Overview
This project automates the deployment of cloud infrastructure using Terraform. It includes the setup of a Virtual Private Cloud (VPC), subnets, security groups, EC2 instances with preinstalled WordPress, an RDS database, S3 bucket for media, ElastiCache for caching, and a backup plan on AWS.

## Table of Contents
1. [Problem](#problem)
2. [Solution](#solution)
3. [Impact](#impact)
4. [Getting Started](#getting-started)
   - [Requirements](#requirements)
   - [Setup](#setup)
5. [Implementation](#implementation)
   - [Terraform Configuration](#terraform-configuration)
   - [Validation and Planning](#validation-and-planning)
   - [Deployment](#deployment)
6. [Cleanup](#cleanup)
7. [Repository](#repository)
8. [Contributing](#contributing)
9. [License](#license)

## Problem
Managing cloud infrastructure manually can be time-consuming and error-prone. As the complexity of infrastructure grows, maintaining consistency and repeatability becomes a significant challenge.

## Solution
I developed a Terraform project to automate the deployment of cloud infrastructure. Terraform allows for infrastructure as code, enabling version control, collaboration, and automation. The project includes setting up a VPC, subnets, security groups, EC2 instances with preinstalled WordPress, an RDS database, S3 bucket for media, ElastiCache for caching, and a backup plan.

## Impact
This project demonstrates the ability to efficiently manage cloud resources using infrastructure as code, reducing manual errors and improving deployment speed. It showcases skills in Terraform, AWS, and automation.

## Getting Started

### Requirements
- AWS Account
- Terraform installed (version >= 0.12)

### Install Terraform
1. **Download Terraform**:
    - Go to the [Terraform download page](https://www.terraform.io/downloads.html).
    - Download the appropriate package for your operating system.

2. **Install Terraform**:
    - On macOS:
      ```sh
      brew install terraform
      ```
    - On Linux:
      ```sh
      sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
      wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
      echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
      sudo apt-get update && sudo apt-get install terraform
      ```
    - On Windows:
      - Use the provided `.exe` installer or use [Chocolatey](https://chocolatey.org/) with the command:
      ```sh
      choco install terraform
      ```

3. **Verify Installation**:
    ```sh
    terraform -v
    ```

### Setup

1. **Clone the Repository**
    ```sh
    git clone https://github.com/talagart/spimple-terraform-project.git
    cd spimple-terraform-project
    ```

2. **Initialize Terraform**
    ```sh
    terraform init
    ```

3. **Configure AWS Credentials**
    Ensure your AWS credentials are configured. You can use the AWS CLI to configure your credentials:
    ```sh
    aws configure
    ```

## Implementation

### Terraform Configuration

Terraform builds the infrastructure based on the configuration defined in the `main.tf` file located in the repository. The resources created by this configuration include:

- **VPC (Virtual Private Cloud)**: Provides an isolated network environment within the AWS cloud where you can launch AWS resources.
- **Subnets**: Segment the VPC into smaller, more manageable sections. Each subnet is mapped to a specific availability zone to ensure high availability.
- **Internet Gateway**: Allows instances within the VPC to connect to the internet.
- **Route Table**: Directs internet traffic to the instances in the public subnet via the Internet Gateway.
- **Security Groups**: Act as virtual firewalls for controlling inbound and outbound traffic to AWS resources. This project creates a security group that allows SSH and HTTP access.
- **EC2 Instances**: Virtual servers running in the cloud. This project deploys EC2 instances within the created subnets, with a pre-installed WordPress application. The selected Amazon Machine Image (AMI) includes WordPress and its configuration can be found [here](https://docs.bitnami.com/aws/apps/wordpress-pro/).
- **RDS Database Instance**: Provides a managed relational database for the WordPress application. This project creates an RDS instance using MySQL.
- **S3 Bucket**: Used for storing media files. The bucket has ACLs configured for appropriate access control.
- **ElastiCache Cluster**: Provides a caching layer to improve the performance of the WordPress application. This project uses Redis as the caching engine.
- **Backup Vault**: Used for managing backups of the infrastructure. This project creates a backup vault and a backup plan for the EC2 instances.

### Validation and Planning

Before applying the Terraform configuration, it’s good practice to validate the configuration and create an execution plan.

1. **Validate the Configuration**:
    ```sh
    terraform validate
    ```
    This command checks the configuration files for syntax errors and other issues.

2. **Create an Execution Plan**:
    ```sh
    terraform plan
    ```
    This command creates an execution plan, showing what actions Terraform will take to create the resources. Review this output to ensure everything looks correct.

### Deployment

To apply the Terraform configuration and deploy the infrastructure:

1. **Apply the Configuration**:
    ```sh
    terraform apply
    ```
    Review the plan and type `yes` to confirm and apply the changes.

## Cleanup

To remove the infrastructure and avoid any charges, run:
```sh
terraform destroy
```
This command will remove all resources defined in the configuration files.

### Repository
For full code and instructions, visit the GitHub repository.

### Contributing
Contributions are welcome! Please open an issue or submit a pull request.

### License
This project is licensed under the MIT License. See the LICENSE file for details.

