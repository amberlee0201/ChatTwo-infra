# Route53 Hosted Zone 생성
resource "aws_route53_zone" "main" {
  name = var.domain_name
}