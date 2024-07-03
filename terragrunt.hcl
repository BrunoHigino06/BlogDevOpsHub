locals {
  full_module_path = get_terragrunt_dir()
  dir_name = basename(local.full_module_path)
}

remote_state {
  backend = "s3"
  generate = {
    path      = "provider.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "terraform-all-tfstates-4asdasaqpfgxczmx"
    key = "${local.dir_name}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true

  }
}