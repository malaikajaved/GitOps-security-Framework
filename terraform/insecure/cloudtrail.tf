resource "aws_cloudtrail" "insecure_trail" {
  name                          = "insecure-trail"
  s3_bucket_name                = "my-insecure-bucket"
  include_global_service_events = false
  is_multi_region_trail         = false
  enable_logging                = false
}

resource "aws_s3_bucket" "no_versioning_bucket" {
  bucket = "my-no-versioning-bucket"
}

resource "aws_s3_bucket_versioning" "no_versioning" {
  bucket = aws_s3_bucket.no_versioning_bucket.id
  versioning_configuration {
    status = "Suspended"
  }
}
