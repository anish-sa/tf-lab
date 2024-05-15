resource "aws_db_subnet_group" "default_subnet_group" {
    name = "default_subnet_group_db"
    subnet_ids = aws_subnet.private_subnets[*].id
}

resource "aws_db_instance" "private_db" {
  db_name              = "app_db"
  instance_class       = var.db_instance_type
  db_subnet_group_name = aws_db_subnet_group.default_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot = true
  apply_immediately    = true
  allocated_storage = 10
  engine = "mysql"
  engine_version = "8.0"
  username = "dbuser"
  password = "pass1234"
}
