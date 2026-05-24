resource "aws_security_group" "rule_web" {
  name        = "Web_Rules"
  description = "Allow traffic"

  tags = {
    "Name"    = var.name
    "Env"     = "wordpress-${var.name}-${var.environment}"
    "Project" = var.environment
  }
}

resource "aws_security_group_rule" "ingress" {
  for_each          = toset(var.web_ingress)
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rule_web.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  security_group_id = aws_security_group.rule_web.id
}

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = data.aws_key_pair.existing.key_name
  vpc_security_group_ids = [aws_security_group.rule_web.id]
  tags = {
    "Name"    = var.name
    "Project" = "${var.name}-${var.environment}"
    "Env"     = var.environment
  }
}

resource "aws_instance" "backup" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = data.aws_key_pair.existing.key_name
  vpc_security_group_ids = [aws_security_group.rule_web.id]
  tags = {
    "Name"    = "${var.name}-backup"
    "Project" = "backup-${var.name}-${var.environment}"
    "Env"     = var.environment
  }
}
resource "aws_route53_record" "wordpress" {
  name    = var.domain
  ttl     = 50
  type    = "A"
  zone_id = data.aws_route53_zone.dns.zone_id
  records = [aws_instance.web.public_ip]
}

resource "local_file" "ansible_inventory" {
    filename = "../Ansible/inventory.txt"
    content = <<EOT
    [wordpress]
    ${aws_instance.web.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/ansible.pem
    EOT
}
