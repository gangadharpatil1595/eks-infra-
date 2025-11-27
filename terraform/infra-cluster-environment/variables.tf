
variable "region" {
  type        = string
  description = "AWS region"
}

variable "env" {
  type        = string
  description = "Environment name (dev/stage/prod)"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "public_key" {
  type        = string
  description = "SSH public key for bastion/jump server"
}

variable "jump_instance_type" {
  type    = string
  default = "t3.micro"
}
