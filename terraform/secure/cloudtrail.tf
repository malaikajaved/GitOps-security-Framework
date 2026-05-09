# SECURE: CloudTrail with logging enabled
resource "aws_cloudtrail" "secure_trail" {
  name                          = "secure-trail"
  s3_bucket_name                = "my-secure-bucket"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }
}
# SECURE: S3 bucket with versioning enabled
resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "my-versioned-secure-bucket"
}

resource "aws_s3_bucket_versioning" "enabled_versioning" {
  bucket = aws_s3_bucket.versioned_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
