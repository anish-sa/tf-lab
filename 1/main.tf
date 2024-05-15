resource "aws_key_pair" "ssh_key" {
  key_name   = "anish_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsbwyYuG8LPv5UorIfpTdHWiO/qo3aOymvr9ALfYGMyXQ/52ySMgENEyVToamRxXh8xyRNuVKhe2rLZkSkS9ulg3SmtuDrFE1XYLy1ou1PQJqSBeI1RwzDa8vBapn3lwufkU5K4pByaYgoXWHoLN9F3SxJ9vMyjgKyB6w8ZOlbILgGQDOfOYnzz/8DlEYbdAB24ZSKPMTK6Zjw8HSQycy/4i12boHSSn99s5sThwP6NFZ8VpFkbAfJBqQ5VgstGkDVhaTIUQMhqUghNKuK5JIn9gKF2jmxSzqGmw8aXfTNY4csrx0lKJtAd2MobDRZL2qeP/gApyNUFRcW+mQRHFMn"
}

resource "aws_security_group" "server_sg" {
  vpc_id = var.default_vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = "22"
  to_port           = "22"
}

resource "aws_vpc_security_group_egress_rule" "allow_everything" {
  security_group_id = aws_security_group.server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "public_server" {
  count                       = 3
  ami                         = var.instance_ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids      = [aws_security_group.server_sg.id]

  tags = {
    Name = "${var.instance_name}_${count.index}"
  }
}
