module "internet_gateway" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=internet_gateway"

  internet_gateway = [
    for internet_gateway in var.internet_gateway : {
        name     = internet_gateway.name
        vpc_name = internet_gateway.vpc_name
        tags     = var.tags
    }
  ]
  depends_on = [
    module.vpc
  ]
}