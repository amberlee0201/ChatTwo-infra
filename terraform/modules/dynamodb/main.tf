resource "aws_dynamodb_table" "chat2_dynamodb_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.partition_key
  range_key    = var.sort_key != null ? var.sort_key : null

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.gsi_data
    content {
      name            = global_secondary_index.value.name
      hash_key        = global_secondary_index.value.partition_key
      range_key       = lookup(global_secondary_index.value, "sort_key", null)
      projection_type = global_secondary_index.value.projection_type
    }
  }

  tags = {
    Name        = "dynamodb-table-${var.dynamodb_table_name}"
    Environment = "Infrastructure"
  }
}