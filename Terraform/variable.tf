variable aws_region {
  type        = string
  description = "Ec2-build region"
}
variable environment {
    type = string
    description = "Tag of environment"
}
variable name {
    type = string
    description = "Name of project"
}
variable ami_id {
    type = string
    description = "AMI ID of AWS_REGION"
}
variable web_ingress{
    type = list
    description = "all ports of ingress"
}
variable type{
type = string
}
