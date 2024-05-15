resource "aws_security_group" "server_sg" {
	vpc_id = aws_vpc.main_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
	security_group_id = aws_security_group.server_sg.id
	cidr_ipv4 = "0.0.0.0/0"
	ip_protocol = "tcp"
	from_port = "22"
	to_port = "22"
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh" {
	security_group_id = aws_security_group.server_sg.id
	cidr_ipv4 = "0.0.0.0/0"
	ip_protocol = "-1"
}