provider "aws" {
  region = "eu-west-2"
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
# INSECURE: RDS database publicly accessible
resource "aws_db_instance" "insecure_db" {
  identifier          = "insecure-db"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "password123"
  publicly_accessible = true
  skip_final_snapshot = true
}
