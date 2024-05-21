module "network_acl" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=network_acl"
  network_acl =  [
    for network_acl in var.network_acl : {
        name          = network_acl.name
        vpc_id        = data.aws_vpc.vpc.id
        subnet_ids    = [for subnet in data.aws_subnet.subnet : subnet.id]
        tags          = var.tags
        egress        = [
            for egress in network_acl.egress : {
                protocol    = egress.protocol
                rule_no     = egress.rule_no
                action      = egress.action
                cidr_block  = egress.cidr_block
                from_port   = egress.from_port
                to_port     = egress.to_port
            }
        ]
        ingress       = [
            for ingress in network_acl.ingress : {
                protocol    = ingress.protocol 
                rule_no     = ingress.rule_no
                action      = ingress.action
                cidr_block  = ingress.cidr_block
                from_port   = ingress.from_port
                to_port     = ingress.to_port
            }
        ]
    }
  ]
  depends_on = [ 
    data.aws_subnet.subnet
  ]
}