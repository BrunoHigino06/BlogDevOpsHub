module "route_table_association" {
    source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=route_table_association"

    route_table_association = [
        for association in var.route_table_association : {
            route_table_unique_name = association.route_table_unique_name
            subnet_unique_name      = association.subnet_unique_name
            gateway_name            = association.gateway_name
        }
    ]
  depends_on = [
    module.route_table
  ]
}