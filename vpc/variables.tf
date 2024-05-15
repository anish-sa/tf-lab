variable "instance_name" {
    description = "Value of name tag for EC2 instance"
    type = string
    default = "anish_server"
}

variable "instance_ami_id" {
    description = "Default AMI id for EC2 instance (Ubuntu 22.04)"
    type = string
    default = "ami-0b986fc833876b42e"
}

variable "instance_type" {
    description = "Default type for EC2 instance"
    type = string
    default = "t2.micro"
}

variable "vpc_cidr" {
    description = "CIDRs for VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
    description = "CIDRs for private subnet"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
    description = "CIDRs for public subnet"
    type = list(string)
    default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "availability_zones" {
    description = "Availability zones for subnets"
    type = list(string)
    default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "bucket_name" {
    description = "Default name for the s3 bucket"
    type = string
    default = "5555-server-bucket"
}

variable "ssh_key_public" {
    description = "Contents of public key file"
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsbwyYuG8LPv5UorIfpTdHWiO/qo3aOymvr9ALfYGMyXQ/52ySMgENEyVToamRxXh8xyRNuVKhe2rLZkSkS9ulg3SmtuDrFE1XYLy1ou1PQJqSBeI1RwzDa8vBapn3lwufkU5K4pByaYgoXWHoLN9F3SxJ9vMyjgKyB6w8ZOlbILgGQDOfOYnzz/8DlEYbdAB24ZSKPMTK6Zjw8HSQycy/4i12boHSSn99s5sThwP6NFZ8VpFkbAfJBqQ5VgstGkDVhaTIUQMhqUghNKuK5JIn9gKF2jmxSzqGmw8aXfTNY4csrx0lKJtAd2MobDRZL2qeP/gApyNUFRcW+mQRHFMn"
}