module "network" {
  source = "./modules/network"
}

module "security" {

  source = "./modules/security"

  vpc_id = module.network.vpc_id
}

module "flask_ec2" {

  source = "./modules/flask-ec2"

  subnet_id         = module.network.subnet_id
  security_group_id = module.security.flask_sg_id

  instance_type = var.instance_type
  key_name      = var.key_name
}

module "express_ec2" {

  source = "./modules/express-ec2"

  subnet_id         = module.network.subnet_id
  security_group_id = module.security.express_sg_id

  instance_type = var.instance_type
  key_name      = var.key_name
}