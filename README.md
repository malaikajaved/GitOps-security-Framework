# GitOps Security Framework

A GitOps-based framework for automated security policy 
enforcement in cloud infrastructure.

## Overview

This framework automatically scans Terraform Infrastructure 
as Code (IaC) files for security misconfigurations every 
time code is pushed to the repository. Built as part of a 
final year dissertation project.

**Tools used:** GitHub Actions, Terraform, Checkov  
**Cloud provider:** AWS (eu-west-2)  
**Scan time:** ~35 seconds

## Repository Structure

- `.github/workflows/security-scan.yml` — GitHub Actions pipeline
- `terraform/insecure/` — Deliberately vulnerable Terraform files
- `terraform/secure/` — Correctly configured Terraform files

## How to Run

1. Fork this repository
2. Push any change to the main branch
3. Go to the Actions tab to see Checkov results
4. Fix any flagged violations and push again

## Security Checks Performed

| Check ID | Description |
|----------|-------------|
| CKV_AWS_20 | S3 bucket public read access |
| CKV_AWS_62 | IAM full admin privileges |
| CKV_AWS_25 | Security group open to all traffic |
| CKV_AWS_67 | CloudTrail logging disabled |
| CKV_AWS_3 | EBS volume unencrypted |
| CKV_AWS_17 | RDS publicly accessible |
