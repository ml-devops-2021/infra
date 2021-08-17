output "deployment_name" {
  description = "DEPLOYMENT_NAME"
  value = var.deployment_name
}

output "image" {
  description = "IMAGE"
  value = var.image
}

output "bucket_terraform" {
  description = "Nombre del bucket para el state de Terraform"
  value = var.bucket_terraform
}