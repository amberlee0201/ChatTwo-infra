output "ecr_url" {
  description = "ECR URL"
  value = aws_ecr_repository.private_ecr.repository_url
}