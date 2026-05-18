# INSECURE: Lambda function without encryption or tracing
resource "aws_lambda_function" "insecure_lambda" {
  filename      = "lambda.zip"
  function_name = "insecure-lambda"
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  runtime       = "python3.9"
}
