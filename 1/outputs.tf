output "server_id" {
    value = aws_instance.public_server[*].id
}