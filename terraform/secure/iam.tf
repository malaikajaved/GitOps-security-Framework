# SECURE: IAM policy with minimal permissions
resource "aws_iam_policy" "secure_policy" {
  name = "secure-minimal-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::my-secure-bucket/*"
      }
    ]
  })
}
