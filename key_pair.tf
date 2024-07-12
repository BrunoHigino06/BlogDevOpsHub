module "key_pair" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=key_pair"

  key_pair = [
    for key_pair in var.key_pair : {
        key_name        = key_pair.key_name
        algorithm       = key_pair.algorithm
        rsa_bits        = key_pair.rsa_bits
        file_permission = key_pair.file_permission
    }
  ]
}