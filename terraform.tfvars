# Global inputs
  tags = {
    Owner = "cloud_admin"
  }

# VPC inputs
  vpc             = {
    name          = "BlogDevOpsHub"
    cidr_block    = "10.0.0.0/16"
  }

# Subnet inputs
  subnet = [ 
    {
      name              = "public"
      cidr_block        = "10.0.0.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "k8s"
      cidr_block        = "10.0.10.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "CircleCI"
      cidr_block        = "10.0.20.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "database_1"
      cidr_block        = "10.0.30.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "database_2"
      cidr_block        = "10.0.40.0/24"
      availability_zone = "us-east-1b"
    },
    {
      name              = "ansible"
      cidr_block        = "10.0.50.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "prometheus"
      cidr_block        = "10.0.60.0/24"
      availability_zone = "us-east-1a"
    }
  ]

# Security group inputs
  security_group = [ 
    {
      name = "public"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    },
    {
      name = "k8s"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    },
    {
      name = "CircleCI"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    },
    {
      name = "database"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    },
    {
      name = "ansible"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    },
    {
      name = "prometheus"
      description = "Security group"

      egress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]

      ingress = [ 
        {
          from_port = "0"
          to_port   = "0"
          protocol  = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        } 
      ]
    }
  ]

# Netowrk ACL
  network_acl = [ 
    {
      name = "network_acl"
      subnet_name = [ 
        "public",
        "k8s",
        "CircleCI",
        "database_1",
        "database_2",
        "ansible",
        "prometheus",
       ]
      egress = [
        {
          protocol    = "-1" 
          rule_no     = "100"
          action      = "allow"
          cidr_block  = "0.0.0.0/0"
          from_port   = "0"
          to_port     = "0"
        }
      ]
      ingress = [ 
        {
          protocol    = "-1" 
          rule_no     = "100"
          action      = "allow"
          cidr_block  = "0.0.0.0/0"
          from_port   = "0"
          to_port     = "0"
        } 
      ]
    } 
  ]

# Internet Gateway inputs
  internet_gateway  = [ 
    {
      name          = "IGW"
      vpc_name      = "BlogDevOpsHub"
    },
  ]
  
# route_table inputs
  route_table           = [ 
    {
      name              = "environment"
      route             = [ 
        {
          cidr_block    = "0.0.0.0/0"
          gateway_name  = "IGW"
        } 
      ]
    } 
  ]

# route table association input
  route_table_association = [
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "public"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "k8s"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "CircleCI"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "database_1"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "database_2"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "ansible"
    },
    {
      route_table_unique_name = "environment"
      subnet_unique_name      = "prometheus"
    },
  ]

# ec2 instances input
  ec2_instance = [
    {
      name                        = "bastion"
      subnet_name                 = "public"
      security_group_name         = ["public"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/general.sh"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
    {
      name                        = "k8s_master"
      subnet_name                 = "k8s"
      security_group_name         = ["k8s"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      private_ip                  = "10.0.10.10"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/general.sh"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
    {
      name                        = "k8s_node"
      subnet_name                 = "k8s"
      security_group_name         = ["k8s"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/general.sh"
      private_ip                  = "10.0.10.20"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
    {
      name                        = "CircleCI"
      subnet_name                 = "CircleCI"
      security_group_name         = ["CircleCI"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/general.sh"
      private_ip                  = "10.0.20.10"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
    {
      name                        = "ansible"
      subnet_name                 = "ansible"
      security_group_name         = ["ansible"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/ansible.sh"
      private_ip                  = "10.0.50.10"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
    {
      name                        = "prometheus"
      subnet_name                 = "prometheus"
      security_group_name         = ["prometheus"]
      instance_type               = "t2.medium"
      ami                         = "ami-04b70fa74e45c3917"
      key_name                    = "test"
      associate_public_ip_address = "true"
      user_data_file_name         = "./user_data/general.sh"
      private_ip                  = "10.0.60.10"
      ebs_block_device            = {
        device_name               = "/dev/sdf"
        volume_size               = "50"
        volume_type               = "gp3"
      }
    },
  ]

# db subnet group vars
  db_subnet_group = [
    {
      name          = "db_subnet_group"
      subnet_names  = ["database_1", "database_2"]
    }
  ]

# db instance
  db_instance = [ 
    {
      allocated_storage     = "10"
      db_name               = "blogDB"
      db_subnet_group_name  = "db_subnet_group"
      engine                = "mysql"
      engine_version        = "8.0.35"
      instance_class        = "db.t3.micro"
      name                  = "blogDB"
      identifier            = "blogdb"
      parameter_group_name  = "default.mysql8.0"
      skip_final_snapshot   = "true"
      username              = "admin"
    } 
  ]