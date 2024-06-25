/*module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
  name        = var.name
  environment = var.bucket_name
}*/

module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
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

module "flow_log_iam_role" {
  source               = "./iam-role-policy"
  flow_log_policy_name = "dev_proj_1_flow_log_role"
}

module "log_group" {
  source         = "./log-group"
  log_group_name = "dev-proj-1-log-group"
  tags = {
    Environment = "dev-1"
    Application = "devops-project"
  }
}

module "vpc_flow_log" {
  source                    = "./flow-log"
  vpc_flow_log_group_arn    = module.log_group.dev_proj_1_log_group_arn
  vpc_id                    = module.networking.dev_proj_1_vpc_id
  vpc_flow_log_iam_role_arn = module.flow_log_iam_role.flow_log_role_Arn
}

