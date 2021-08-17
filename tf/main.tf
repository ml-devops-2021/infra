terraform {
  backend "gcs" {
    bucket = "bucket-terraform--devops-ml-20210811"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.80.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}