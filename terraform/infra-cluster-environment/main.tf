
# VPC
module "vpc" {
  source = "../modules/vpc"

  env            = var.env
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}

# Key pair
module "key_pair" {
  source     = "../modules/key-pair"
  env        = var.env
  public_key = var.public_key
}

# EKS
module "eks" {
  source = "../modules/eks"

  env                = var.env
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}

# Jump server
module "jump_server" {
  source = "../modules/jump-server"

  env              = var.env
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  key_name         = module.key_pair.key_name
  instance_type    = var.jump_instance_type
}

# VPC Endpoints
module "vpc_endpoints" {
  source = "../modules/vpc-endpoints"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}
