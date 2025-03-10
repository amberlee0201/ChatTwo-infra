variable "s3_bucket_name" {
  description = "The name of S3 file bucket"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "cloudfront_domain" {
  description = "The subdomain for CloudFront (e.g., cdn.example.com)"
  type        = string
}

variable "domain_name" {
  description = "value of domain name"
  type        = string
}