data "aws_key_pair" "existing" {
  key_name = "ansible"
}
data "aws_route53_zone" "dns" {
  name = "basilg.shop"
}
