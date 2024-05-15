output "server_id" {
    value = aws_instance.public_server[*].id
}

output "server_public_ip" {
    value = aws_instance.public_server.public_ip
}

output "database_endpoint" {
    value = aws_db_instance.private_db.endpoint
}