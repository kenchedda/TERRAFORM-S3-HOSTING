variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "my_s3_bucket" {
  description = "S3 Bucket name that we pass to S3 Custom Module"
  type = string
  default = "mybucket-1047"
}

variable "my_s3_tags" {
  description = "Tags to set on the bucket"
  type = map(string)
  default = {
    Terraform = "true"
    Environment = "dev"
    newtag1 = "tag1"
    newtag2 = "tag2"
  }
}

variable "my_s3_policy" {
  description = "S3 Bucket name that we pass to S3 Custom Module"
  type = string
  default = "mybucket-policy"
}