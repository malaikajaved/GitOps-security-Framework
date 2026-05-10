provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
}

resource "aws_s3_bucket_acl" "secure_acl" {
  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"


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
# SECURE: RDS database not publicly accessible
resource "aws_db_instance" "secure_db" {
  identifier          = "secure-db"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "password123"
  publicly_accessible = false
  skip_final_snapshot = true
  storage_encrypted   = true
}
