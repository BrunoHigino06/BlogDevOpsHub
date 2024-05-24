module "ec2_instance" {
  source = "git::https://github.com/BrunoHigino06/AWS_TerraformModules.git?ref=ec2_instance"

  ec2_instance = [
    for ec2_instance in var.ec2_instance : 
    {
        name                                = ec2_instance.name
        instance_type                       = ec2_instance.instance_type
        tags                                = var.tags
        key_name                            = ec2_instance.key_name
        ami                                 = ec2_instance.ami
        associate_public_ip_address         = ec2_instance.associate_public_ip_address
        subnet_name                         = ec2_instance.subnet_name
        security_group_name                 = ec2_instance.security_group_name
        user_data                           = file(ec2_instance.user_data_file_name)
        ebs_block_device                    = {
                volume_size                 = ec2_instance.ebs_block_device.volume_size
                volume_type                 = ec2_instance.ebs_block_device.volume_type
                device_name                 = ec2_instance.ebs_block_device.device_name
            }
    }
  ]
  depends_on = [ 
    module.security_group,
    module.subnet
  ]
}