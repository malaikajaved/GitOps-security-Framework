# INSECURE: Unencrypted EBS volume
resource "aws_ebs_volume" "insecure_ebs" {
  availability_zone = "eu-west-2a"
  size              = 20
  encrypted         = false
}

