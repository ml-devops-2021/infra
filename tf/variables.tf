variable "deployment_name" {
  description = "DEPLOYMENT_NAME"
  type = string
}

variable "image" {
  description = "IMAGE"
  type = string
}

variable "bucket_terraform" {
  description = "Nombre del bucket para el state de Terraform"
  type = string
}
