module "route_table" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=route_table"

  route_table = [
    for route_table in var.route_table : 
    {
        name                  = route_table.name
        unique_name           = route_table.name
        vpc_id                = data.aws_vpc.vpc.id
        tags                  = var.tags
        route                 = [
            for route in route_table.route : 
            {
                cidr_block           = route.cidr_block
                gateway_name         = route.gateway_name
            }
        ]
    }
  ]
  depends_on = [
    module.internet_gateway
  ]
}