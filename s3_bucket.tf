resource "aws_s3_bucket" "s3_bucket" {
  bucket   = "${var.backend-name-prepend}-${local.account_id}"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = false
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
         sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(
    local.required_tags,
    map(
      "Name", "${var.backend-name-prepend}-${local.account_id}"
    )
  )
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.iam_policy_document-s3_bucket_policy-policy.json
  depends_on = [
    aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  ]
}

data "aws_iam_policy_document" "iam_policy_document-s3_bucket_policy-policy" {
  statement {
    sid    = "RequireEncryptedTransport"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = [
          "*"
      ]
    }
    actions = [
      "s3:*"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_bucket.bucket}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
  statement {
    sid    = "RequireEncryptedStorage"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = [
          "*"
      ]
    }
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_bucket.bucket}/*"
    ]
    condition {
      test     = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption"
      values   = ["AES256"]
    }
  }
}
