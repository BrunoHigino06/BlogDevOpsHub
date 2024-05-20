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