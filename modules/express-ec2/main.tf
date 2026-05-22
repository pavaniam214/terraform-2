resource "aws_instance" "express_server" {

  ami           = "ami-03f4878755434977f"
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "Express-Frontend-Server"
  }
}