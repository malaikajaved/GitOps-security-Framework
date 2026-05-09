hcl

provider "aws" {
  region = "eu-west-2"
}

# SECURE: S3 bucket with private access and encryption
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
}

resource "aws_s3_bucket_acl" "secure_acl" {
  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "secure_encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

