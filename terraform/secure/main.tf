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

rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
# SECURE: Security group with restricted access
resource "aws_security_group" "secure_sg" {
  name = "secure-sg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}
