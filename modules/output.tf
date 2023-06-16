output "arn" {
  description = "ARN of the S3 Bucket"
  value       = aws_s3_bucket.terrabucket.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.terrabucket.id
}

output "domain" {
  description = "Domain Name of the bucket"
  value       = aws_s3_bucket.terrabucket.website_domain
}

output "endpoint" {
  description = "Endpoint Information of the bucket"
  value       = aws_s3_bucket.terrabucket.website_endpoint
}