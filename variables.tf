# Global vars
  variable "tags" {
    type = map(string)
    description = "Tags for global use"
  }

# VPC Vars
  variable "vpc" {
    type          = object({
      name        = string
      cidr_block  = string
    })
    description = "VPC variables"
  }

# subnet vars
  variable "subnet" {
    type                                             = list(object({
      name                                           = string
      cidr_block                                     = optional(string)
      availability_zone                              = optional(string)
      }))
      description = "subnet variables"
      default = null
  }

# security group vars
  variable "security_group" {
    type                     = list(object({
      name                   = optional(string)
      description            = optional(string)
      egress                 = list(object({
        from_port            = string 
        to_port              = string
        protocol             = string
        cidr_blocks          = optional(list(string))
        description          = optional(string)
      }))
      ingress       = list(object({
        from_port            = string 
        to_port              = string
        protocol             = string
        cidr_blocks          = optional(list(string))
        description          = optional(string)
      }))
    }))
    description = "security groups"
  }

# netowork ACL vars
variable "network_acl" {
  type            = list(object({
    name          = string
    subnet_name   = list(string)
    egress        = list(object({
      protocol    = string 
      rule_no     = string
      action      = string
      cidr_block  = string
      from_port   = string
      to_port     = string
    }))
    ingress       = list(object({
      protocol    = string 
      rule_no     = string
      action      = string
      cidr_block  = string
      from_port   = string
      to_port     = string
    }))
  }))
}