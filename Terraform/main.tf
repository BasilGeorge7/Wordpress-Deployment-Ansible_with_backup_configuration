resource "aws_security_group" "rule_web" {
  name        = "Web_Rules"
  description = "Allow ssh traffic"

  tags = {
    "Name" = var.name
    "Env"    = "wordpress-${var.name}-${var.environment}"
    "Project" = var.environment
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rule_web.id
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
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
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.rule_web.id]
  tags = {
    "Name"    = var.name
    "Project" = "zomato-${var.name}-${var.environment}"
    "Env"     = var.environment
  }
}