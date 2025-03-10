resource "aws_s3_bucket" "file_bucket" {
  bucket = var.s3_bucket_name
  
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "File Storage"
    Environment = "Service"
  }
}

resource "aws_s3_bucket_public_access_block" "file_bucket_public_block" {
  bucket                  = aws_s3_bucket.file_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.file_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
}

data "aws_iam_policy_document" "allow_access_from_cloudfront" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.file_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.file_bucket_oai.iam_arn]
    }
  }
}