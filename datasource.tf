locals {
    subnet_unique_names   = flatten([for subnet in var.network_acl : subnet.subnet_name])
}

# Data aws vpc
  data "aws_vpc" "vpc" {
    filter {
      name = "tag:Name"
      values = [var.vpc.name]
    }

    depends_on = [ 
      module.vpc
    ]
  }

# Data subnets
  data "aws_subnet" "subnet" {
    for_each = { for subnet in local.subnet_unique_names : subnet => subnet }

    filter {
      name = "tag:unique_name"
      values = [each.key]
    }
    
    depends_on = [ 
      module.subnet
    ]
  }