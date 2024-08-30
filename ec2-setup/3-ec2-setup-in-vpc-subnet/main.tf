
module "networking" {
  source                       = "./networking"
  vpc_cidr                     = var.vpc_cidr
  vpc_name                     = var.vpc_name
  cidr_public_subnet           = var.cidr_public_subnet
  eu_availability_zone         = var.eu_availability_zone
  cidr_private_subnet          = var.cidr_private_subnet
  public_subnet_ipv6_prefixes  = var.public_subnet_ipv6_prefixes
  private_subnet_ipv6_prefixes = var.private_subnet_ipv6_prefixes
}

module "security_group" {
  source                     = "./security-groups"
  ec2_sg_name                = "SG for EC2 to enable SSH(22) and HTTP(80)"
  vpc_id                     = module.networking.dev_proj_1_vpc_id
  public_subnet_cidr_block   = tolist(module.networking.public_subnet_cidr_block)
  ec2_sg_name_for_python_api = "SG for EC2 for enabling port 5000"
}

module "ec2" {
  source                     = "./ec2"
  ami_id                     = var.ec2_ami_id
  instance_type              = "t2.micro"
  tag_name                   = "Ubuntu Linux EC2"
  public_key                 = var.public_key
  subnet_id                  = tolist(module.networking.dev_proj_1_public_subnets)[0]
  sg_enable_ssh_https        = module.security_group.sg_ec2_sg_ssh_http_id
  ec2_sg_name_for_python_api = module.security_group.sg_ec2_for_python_api
  enable_public_ip_address   = true
  user_data_install_apache   = templatefile("./template/ec2_install_apache.sh", {})
}


