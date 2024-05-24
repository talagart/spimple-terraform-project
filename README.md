# Simple Terraform Project

## Overview
This project automates the deployment of cloud infrastructure using Terraform. It includes the setup of a Virtual Private Cloud (VPC), subnets, security groups, and EC2 instances on AWS.

## Table of Contents
1. [Problem](#problem)
2. [Solution](#solution)
3. [Impact](#impact)
4. [Getting Started](#getting-started)
   - [Requirements](#requirements)
   - [Setup](#setup)
5. [Implementation](#implementation)
   - [Terraform Configuration](#terraform-configuration)
6. [Cleanup](#cleanup)
7. [Repository](#repository)
8. [Contributing](#contributing)
9. [License](#license)

## Problem
Managing cloud infrastructure manually can be time-consuming and error-prone. As the complexity of infrastructure grows, maintaining consistency and repeatability becomes a significant challenge.

## Solution
I developed a Terraform project to automate the deployment of cloud infrastructure. Terraform allows for infrastructure as code, enabling version control, collaboration, and automation. The project includes setting up a VPC, subnets, security groups, and EC2 instances.

## Impact
This project demonstrates the ability to efficiently manage cloud resources using infrastructure as code, reducing manual errors and improving deployment speed. It showcases skills in Terraform, AWS, and automation.

## Getting Started

### Requirements
- AWS Account
- Terraform installed (version >= 0.12)

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

the main Terraform configuration file (`main.tf`):

### Deploy
Run the following command to apply the Terraform configuration and deploy the infrastructure:

```sh
terraform apply
```
### Clean up
To remove the infrastructure and avoid any charges, run:

```sh
terraform destroy
```
### Cleanup
To avoid any unexpected charges, make sure to delete all the AWS resources created during this project:

Run ```terraform destroy``` to remove the infrastructure.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

