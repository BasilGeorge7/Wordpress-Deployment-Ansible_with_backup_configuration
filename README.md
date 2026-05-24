WordPress Infrastructure Automation Project
Overview

This project automates the complete deployment and configuration of a production-ready WordPress environment using:

Terraform for infrastructure provisioning
Ansible for server configuration and application deployment
Amazon Web Services services such as EC2, Security Groups, Key Pairs, and Route 53

The solution follows a two-stage automation workflow:

Infrastructure provisioning using Terraform
Configuration management and application deployment using Ansible
Architecture
Stage 1 – Infrastructure Provisioning (Terraform)

Terraform is used to provision the complete AWS infrastructure required for WordPress hosting.

Resources Created
EC2 instance provisioning
Key Pair creation
Security Group creation
Ingress and egress rule configuration
Route 53 DNS record creation
Dynamic inventory generation for Ansible
Features
Modular Infrastructure as Code
Automated security rule configuration
Dynamic inventory output for seamless Ansible integration
Route 53 integration for domain mapping
Stage 2 – Configuration Management (Ansible)

After infrastructure creation, Ansible uses the Terraform-generated inventory file to configure the server automatically.

Automated Configuration
Apache/Nginx installation
PHP installation and configuration
MySQL/MariaDB server installation
WordPress installation and deployment
WordPress database creation
wp-config.php configuration
File permission management
Backup automation setup
Backup Automation
Website file backup
MySQL database backup
Automated backup scheduling using cron
Backup execution every 15 minutes
Optional remote backup synchronization using rsync
Prerequisites

Before running the project, ensure the following are installed:

Required Tools
Terraform
Ansible
Git
AWS CLI configured with appropriate IAM permissions
