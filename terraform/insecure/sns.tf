# INSECURE: SNS topic without encryption
resource "aws_sns_topic" "insecure_topic" {
  name = "insecure-topic"
}

# INSECURE: SQS queue without encryption
resource "aws_sqs_queue" "insecure_queue" {
  name = "insecure-queue"
}
