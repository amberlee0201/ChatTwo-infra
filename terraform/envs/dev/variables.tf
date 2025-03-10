# backend
variable "s3_backend_bucket_name" {}
variable "dynamodb_table_name" {}

# s3-cloudfront
variable "s3_file_bucket_name" {}
variable "cloudfront_domain" {}

# dns-acm
variable "domain_name" {}

# ecr
variable "ecr_name" {}