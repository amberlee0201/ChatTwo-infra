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

# dynamodb-room
variable "room_dynamodb_table_name" {}
variable "room_partition_key" {}
variable "room_attr" {}

# dynamodb-participation
variable "participation_dynamodb_table_name" {}
variable "participation_partition_key" {}
variable "participation_sort_key" {}
variable "participation_attr" {}
variable "participation_gsi_data" {}

# dynamodb-chat
variable "chat_dynamodb_table_name" {}
variable "chat_partition_key" {}
variable "chat_sort_key" {}
variable "chat_attr" {}