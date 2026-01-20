output "vpc_no" {
  description = "Ncloud VPC No"
  value       = module.vpc.vpc_no
}

output "node_subnet_no" {
  description = "NKS node subnet No"
  value       = module.vpc.node_subnet_no
}

output "cluster_uuid" {
  description = "NKS cluster UUID"
  value       = module.nks.cluster_uuid
}

output "cluster_name" {
  value = module.nks.cluster_name
}
