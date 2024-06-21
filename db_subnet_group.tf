module "db_subnet_group" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=db_subnet_group"


  db_subnet_group = [
    for db_subnet_group in var.db_subnet_group : 
    {
        name         = db_subnet_group.name
        subnet_names = db_subnet_group.subnet_names
        tags         = var.tags
    }
  ]
  depdepends_on = [
    module.subnet
  ]  
}