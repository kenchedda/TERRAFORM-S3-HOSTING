module "website_s3_bucket" {
  source = "./modules"  # Mandatory
  bucket_name = var.my_s3_bucket
  bucket_policy =  var.my_s3_policy
  tags = var.my_s3_tags
}