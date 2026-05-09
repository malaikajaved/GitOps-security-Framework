hcl

resource "aws_cloudtrail" "insecure_trail" {
  name                          = "insecure-trail"
  s3_bucket_name                = "my-insecure-bucket"
  include_global_service_events = false
  is_multi_region_trail         = false
  enable_logging                = false
}
