output "account_id" {
  description = "Account ID"
  value       = local.account_id
}

output "region" {
  description = "Region"
  value       = local.region
}

output "region-abbr" {
  description = "Region"
  value       = var.lookup-region_abbr["${local.region}"]
}

output "s3_bucket-id" {
  description = "S3 Bucket: ID"
  value       = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket-arn" {
  description = "S3 Bucket: ARN"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket-bucket_domain_name" {
  description = "S3 Bucket: Bucket Domain Name"
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "s3_bucket-bucket_regional_domain_name" {
  description = "S3 Bucket: Bucket Regional Domain Name"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "dynamodb_table-id" {
  description = "DynamoDB Table: ID"
  value       = aws_dynamodb_table.dynamodb_table.id
}

output "dynamodb_table-arn" {
  description = "DynamoDB Table: ARN"
  value       = aws_dynamodb_table.dynamodb_table.arn
}