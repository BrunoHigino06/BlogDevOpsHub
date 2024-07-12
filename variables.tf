# Global vars
  variable "tags" {
    type = map(string)
    description = "Tags for global use"
  }

# VPC Vars
  variable "vpc" {
    type                    = object({
      name                  = string
      cidr_block            = string
      enable_dns_support    = string
      enable_dns_hostnames  = string
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

# route_table variables
    variable "route_table" {
    type                            = list(object({
      name                          = string
        route                       = list(object({
          cidr_block                = string
          gateway_name              = optional(string)
        }))      
      }))
      description                   = "route table variables"
      default = null
    }

# Internet gateway variables
    variable "internet_gateway" {
      type            = list(object({
        name          = string
        vpc_name      = string
      }))
      description = "Internet gateway variables"
      default = null
    }
    
# route table association variables
    variable "route_table_association" {
      type                      = list(object({
        subnet_unique_name      = optional(string)
        route_table_unique_name = string
        gateway_name            = optional(string)
      }))
      description = "route table association variables"
      default = null
    } 

# ec2 instance vars
  variable "ec2_instance" {
    type                          = list(object({
      name                        = string
      instance_type               = string
      key_name                    = optional(string)
      ami                         = optional(string)
      associate_public_ip_address = optional(string)
      subnet_name                 = optional(string)
      security_group_name         = optional(list(string))
      user_data_file_name         = optional(string)
      private_ip                  = optional(string)
      ebs_block_device            = optional(object({
        volume_size               = string
        volume_type               = string
        device_name               = string
      }))
    }))
  }

# db subnet group vars
  variable "db_subnet_group" {
    type                  = list(object({
      name                = string
      subnet_names        = list(string)
    }))
  }

# db instance
  variable "db_instance" {
  type                      = list(object({
    name                    = string
    allocated_storage       = string
    db_name                 = string
    engine                  = string
    engine_version          = string
    instance_class          = string
    username                = string
    identifier              = string
    parameter_group_name    = string
    skip_final_snapshot     = string
    db_subnet_group_name    = string
    publicly_accessible     = string
    security_group_name     = list(string)
  }))
}

# Key Pair variable
variable "key_pair" {
    type              = list(object({
      key_name        = string
      algorithm       = string
      rsa_bits        = string
      file_permission = string
    }))
}