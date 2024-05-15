resource "aws_key_pair" "ssh_key" {
  key_name   = "anish_key"
  public_key = var.ssh_key_public
}

resource "aws_instance" "public_server" {
  ami                         = var.instance_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnets[0].id
  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.ssh_key.key_name
	vpc_security_group_ids = [aws_security_group.server_sg.id]
  iam_instance_profile = aws_iam_instance_profile.beanstalk_ec2_profile.name

  tags = {
    Name = "${var.instance_name}_public"
  }
}

resource "aws_instance" "private_server" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnets[0].id
  key_name      = aws_key_pair.ssh_key.key_name
	vpc_security_group_ids = [aws_security_group.server_sg.id]

  tags = {
    Name = "${var.instance_name}_private"
  }
}

# resource "aws_elastic_beanstalk_application" "main_eb" {
# 	name = "cpanel_migration"

# 	# appversion_lifecycle {
# 	# 	service_role = aws_iam_role.main_iam_beanstalk.arm
# 	# }
# }

# resource "aws_elastic_beanstalk_configuration_template" "main_eb_config_template" {
# 	name = "cpanel_migration_eb_config_template"
# 	application = aws_elastic_beanstalk_application.main_eb.name
# 	solution_stack_name = "64bit Amazon Linux 2 v3.5.6 running PHP 8.1"
# }

# resource "aws_elastic_beanstalk_environment" "main_eb_env" {
# 	name = "cpanel_migration_eb_env"
# 	template_name = aws_elastic_beanstalk_configuration_template.main_eb_config_template.name
# 	application = aws_elastic_beanstalk_application.main_eb.name
# }
