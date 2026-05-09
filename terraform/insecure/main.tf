provider "aws" {
  region = "us-east-1"
}

# INSECURE: S3 bucket with public access and no encryption
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket"
}
resource "aws_s3_bucket_acl" "insecure_acl" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}

# INSECURE: Security group allowing all inbound traffic
resource "aws_security_group" "insecure_sg" {
  name = "insecure-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
