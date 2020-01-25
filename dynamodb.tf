resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "${var.backend-name-prepend}-${local.account_id}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
      name = "LockID"
      type = "S"
  }
  tags = merge(
    local.required_tags,
    map(
      "Name", "${var.backend-name-prepend}-${local.account_id}"
    )
  )
}

