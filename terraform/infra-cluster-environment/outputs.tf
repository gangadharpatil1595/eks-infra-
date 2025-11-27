
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "jump_server_public_ip" {
  value = module.jump_server.public_ip
}
