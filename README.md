# 🚀 Project Explanation

This project demonstrates a complete **end-to-end automated deployment of WordPress infrastructure** using Infrastructure as Code and Configuration Management tools.

It is designed in two main stages to ensure scalability, automation, and production readiness.

---

## 🏗️ Stage 1: Infrastructure Provisioning (Terraform)

In this stage, Terraform is used to build the complete AWS cloud infrastructure.

### 🔹 What Terraform Creates:

- EC2 instance for hosting WordPress
- Key Pair for secure SSH access
- Security Group with required inbound/outbound rules
- Security rule configuration (HTTP, HTTPS, SSH, MySQL)
- Route 53 DNS record for domain mapping
- Dynamic inventory file for Ansible automation

### 🔹 Outcome:

At the end of this stage, a fully configured AWS infrastructure is ready and an inventory file is generated for Ansible.

---

## ⚙️ Stage 2: Configuration Management (Ansible)

Once infrastructure is ready, Ansible takes over for server configuration and application deployment.

### 🔹 What Ansible Configures:

- Apache/Nginx web server installation
- PHP installation and configuration
- MySQL/MariaDB server setup
- WordPress installation and deployment
- Database creation and user privileges
- wp-config.php file configuration
- File permissions setup

---

## 🗄️ Backup & Automation

An automated backup system is implemented for data protection.

### 🔹 Features:

- Website file backup
- Database backup using mysqldump
- Cron job scheduling (every 15 minutes)
- Optional remote backup using rsync
- Automatic cleanup of old backups

---

## 🔄 Workflow Summary

```text
Terraform
   ↓
AWS Infrastructure Provisioning
   ↓
Inventory File Generation
   ↓
Ansible Execution
   ↓
WordPress Deployment + Configuration
   ↓
Backup Automation Setup
