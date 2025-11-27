
region          = "ap-south-1"
env             = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
cluster_name    = "dev-eks"
public_key      = "ssh-rsa AAAA....yourkey"
jump_instance_type = "t3.micro"
