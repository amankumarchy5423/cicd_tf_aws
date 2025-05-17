module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "instance" {
  source = "./modules/ec2"
  ec2-sg = module.sg.sg-id
  subnets = module.vpc.subnet_id
  instance-names = var.instance-names
}

# module "alb" {
#   source = "./modules/alb"
#   sg-alb = module.sg.sg-id
#   subnets-alb = module.vpc.subnet_id
#   vpc-id = module.vpc.vpc_id
#   Instance-id = module.instance.instances
# }


# output "instance_ips" {
#   count = length(module.instance.instance_ips)
#   value = "http${module.instance.instance_ips}"
# }