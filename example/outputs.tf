output "account_id" {
    description = "Account ID"
    value       = module.backend.account_id
}

output "region" {
    description = "Region"
    value       = module.backend.region
}

output "s3_bucket-id" {
    description = "S3 Bucket: ID"
    value       = module.backend.s3_bucket-id
}

output "s3_bucket-arn" {
    description = "S3 Bucket: ARN"
    value       = module.backend.s3_bucket-arn
}

output "s3_bucket-bucket_domain_name" {
    description = "S3 Bucket: Bucket Domain Name"
    value       = module.backend.s3_bucket-bucket_domain_name
}

output "s3_bucket-bucket_regional_domain_name" {
    description = "S3 Bucket: Bucket Regional Domain Name"
    value       = module.backend.s3_bucket-bucket_regional_domain_name
}

output "dynamodb_table-id" {
  description = "DynamoDB Table: ID"
  value       = module.backend.dynamodb_table-id
}

output "dynamodb_table-arn" {
  description = "DynamoDB Table: ARN"
  value       = module.backend.dynamodb_table-arn
}
