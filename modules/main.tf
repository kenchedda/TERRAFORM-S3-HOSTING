resource "aws_s3_bucket" "terrabucket" {
  bucket = "var.bucket_name"



  tags          = var.tags
  force_destroy = true
}
resource "aws_s3_bucket_ownership_controls" "s3control" {
  bucket = aws_s3_bucket.terrabucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "pubblock" {
  bucket = aws_s3_bucket.terrabucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3control,
    aws_s3_bucket_public_access_block.pubblock,
  ]

  bucket = aws_s3_bucket.terrabucket.id
  acl    = "public-read"
}

resource "aws_iam_policy" "policy" {
  name        = var.bucket_policy
  description = "My bucket policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = var.bucket_name

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}


