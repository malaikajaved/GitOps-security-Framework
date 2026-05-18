# INSECURE: VPC with DNS disabled and no flow logs
resource "aws_vpc" "insecure_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = false
  enable_dns_support   = false
}
