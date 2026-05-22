output "flask_public_ip" {
  value = module.flask_ec2.public_ip
}

output "express_public_ip" {
  value = module.express_ec2.public_ip
}