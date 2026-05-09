hcl# INSECURE: IAM policy with full admin access
resource "aws_iam_policy" "insecure_policy" {
  name = "insecure-admin-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

# INSECURE: IAM user with no MFA
resource "aws_iam_user" "insecure_user" {
  name = "insecure-user"
}
