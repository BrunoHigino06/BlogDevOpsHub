module "db_instance" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=db_instance"


  db_instance = [
    for db_instance in var.db_instance : 
    {
        name                    = db_instance.name
        allocated_storage       = db_instance.allocated_storage
        db_name                 = db_instance.db_name
        engine                  = db_instance.engine
        engine_version          = db_instance.engine_version
        instance_class          = db_instance.instance_class
        username                = db_instance.username
        identifier              = db_instance.identifier
        parameter_group_name    = db_instance.parameter_group_name
        skip_final_snapshot     = db_instance.skip_final_snapshot
        db_subnet_group_name    = db_instance.db_subnet_group_name
        tags                    = var.tags
    }
  ]
  depends_on = [
    module.db_subnet_group
  ]  
}