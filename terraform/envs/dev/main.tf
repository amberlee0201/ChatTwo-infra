terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = ""
    key            = ""
    region         = ""
    dynamodb_table = ""
    encrypt        = true
  }
}

module "backend" {
  source              = "../../modules/backend"
  s3_bucket_name      = var.s3_backend_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}

module "route53-acm" {
  source      = "../../modules/route53-acm"
  domain_name = var.domain_name
}

module "s3-cloudfront" {
  source            = "../../modules/s3-cloudfront"
  s3_bucket_name    = var.s3_file_bucket_name
  cloudfront_domain = var.cloudfront_domain
  domain_name       = module.route53-acm.domain_name
  route53_zone_id   = module.route53-acm.route53_zone_id
}

module "ecr" {
  source = "../../modules/ecr"
  ecr_name = var.ecr_name
}