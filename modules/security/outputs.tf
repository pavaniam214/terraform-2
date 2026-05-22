output "flask_sg_id" {

  value = aws_security_group.flask_sg.id
}

output "express_sg_id" {

  value = aws_security_group.express_sg.id
}