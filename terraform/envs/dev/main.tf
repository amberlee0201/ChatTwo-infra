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
  source   = "../../modules/ecr"
  ecr_name = var.ecr_name
}

module "dynamodb_room" {
  source              = "../../modules/dynamodb"
  dynamodb_table_name = var.room_dynamodb_table_name
  partition_key       = var.room_partition_key
  attributes          = var.room_attr
}

module "dynamodb_participation" {
  source              = "../../modules/dynamodb"
  dynamodb_table_name = var.participation_dynamodb_table_name
  partition_key       = var.participation_partition_key
  sort_key            = var.participation_sort_key
  attributes          = var.participation_attr
  gsi_data            = var.participation_gsi_data
}

module "dynamodb_chat" {
  source              = "../../modules/dynamodb"
  dynamodb_table_name = var.chat_dynamodb_table_name
  partition_key       = var.chat_partition_key
  sort_key            = var.chat_sort_key
  attributes          = var.chat_attr
}