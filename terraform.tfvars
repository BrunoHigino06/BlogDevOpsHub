# Global inputs
  tags = {
    Owner = "cloud_admin"
  }

# VPC inputs
  vpc             = {
    name          = "BlogDevOpsHub_VPC"
    cidr_block    = "10.0.0.0/16"
  }

# Subnet inputs
  subnet = [ 
    {
      name              = "public_0"
      cidr_block        = "10.0.0.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "k8s"
      cidr_block        = "10.0.10.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "gitlabCICD"
      cidr_block        = "10.0.20.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "argoCD"
      cidr_block        = "10.0.30.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "ansible"
      cidr_block        = "10.0.40.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "prometheus"
      cidr_block        = "10.0.50.0/24"
      availability_zone = "us-east-1a"
    }
  ]

# Security group inputs
  security_group = [ 
    {
      name = "public_SG"
      description = "Security group for the EKS resources"

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
      name = "k8s_SG"
      description = "Security group for the EKS resources"

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
      name = "gitlabCICD_SG"
      description = "Security group for the EKS resources"

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
      name = "argoCD_SG"
      description = "Security group for the EKS resources"

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
      name = "ansible_SG"
      description = "Security group for the EKS resources"

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
      name = "prometheus_SG"
      description = "Security group for the EKS resources"

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
        "public_0",
        "k8s",
        "gitlabCICD",
        "argoCD",
        "ansible",
        "prometheus",
       ]
      egress = [
        {
          protocol    = "tcp" 
          rule_no     = "100"
          action      = "allow"
          cidr_block  = "0.0.0.0/0"
          from_port   = "0"
          to_port     = "65535"
        }
      ]
      ingress = [ 
        {
          protocol    = "tcp" 
          rule_no     = "100"
          action      = "allow"
          cidr_block  = "0.0.0.0/0"
          from_port   = "0"
          to_port     = "65535"
        } 
      ]
    } 
  ]

# Internet Gateway inputs
  internet_gateway  = [ 
    {
      name          = "IGW"
      vpc_name      = "BlogDevOpsHub_VPC"
    },
  ]
  
# route_table inputs
  route_table           = [ 
    {
      name              = "environment_RT"
      route             = [ 
        {
          cidr_block    = "0.0.0.0/0"
          gateway_name  = "IGW"
        } 
      ]
    } 
  ]