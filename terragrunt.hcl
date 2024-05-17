locals {
  base_name = basename(get_terraform_module_path())
}

# Configuração de backend para armazenar o tfstate no bucket S3
terraform {
  backend "s3" {
    bucket         = "terraform-${timestamp()}"
    key            = "${local.base_name}/terraform.tfstate"
    region         = "us-east-1"  # Altere para a região apropriada
    encrypt        = true
  }
}