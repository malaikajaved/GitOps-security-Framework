# INSECURE: Unencrypted EBS volume
resource "aws_ebs_volume" "insecure_ebs" {
  availability_zone = "eu-west-2a"
  size              = 20
  encrypted         = false
}

# INSECURE: Unencrypted RDS snapshot

resource "aws_db_instance" "insecure_rds_snapshot" 
  identifier          = "insecure-rds-snapshot"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "password123"
  publicly_accessible = true
  skip_final_snapshot = true
  storage_encrypted   = false
}
