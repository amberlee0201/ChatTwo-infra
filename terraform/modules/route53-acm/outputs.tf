output "route53_zone_id" {
  description = "The ID of the Route53 Hosted Zone"
  value       = aws_route53_zone.main.zone_id
}

output "domain_name" {
  description = "The domain name"
  value       = var.domain_name
}

output "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.cert.arn
}

output "aws_acm_certificate_validation_cert_arn" {
  description = "The ACM certificate validation"
  value       = aws_acm_certificate_validation.cert.certificate_arn
}