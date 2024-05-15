variable "instance_name" {
    description = "Value of name tag for EC2 instance"
    type = string
    default = "test_web_server"
}

variable "instance_ami_id" {
    description = "Default AMI id for EC2 instance (Ubuntu 22.04)"
    type = string
    default = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
    description = "Default type for EC2 instance"
    type = string
    default = "t2.micro"
}

variable "public_subnet_id" {
    description = "ID of public subnet in default vpc"
    type = string
    default = "subnet-0f97b0bb45cdeb3b7"
}

variable "default_vpc_id" {
    description = "ID of default vpc"
    type = string
    default = "vpc-03d964f7cd3fa2c74"
}