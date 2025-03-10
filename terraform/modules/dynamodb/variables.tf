variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "partition_key" {
  description = "The name of the partition key"
  type        = string
}

variable "sort_key" {
  description = "value of the sort key"
  type        = string
  default     = null
}

variable "attributes" {
  description = "DynamoDB table attributes"
  type = list(object({
    name = string
    type = string
  }))
}

variable "gsi_data" {
  description = "The name of the global secondary index"
  type = list(object({
    name               = string
    partition_key      = string
    sort_key           = optional(string)
    projection_type    = optional(string)
  }))
  default = []
}