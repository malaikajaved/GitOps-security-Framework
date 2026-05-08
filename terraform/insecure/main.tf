provider "aws" {
  region = "us-east-1"
}

# INSECURE: S3 bucket with public access and no encryption
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket"
}
