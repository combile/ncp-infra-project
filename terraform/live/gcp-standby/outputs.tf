output "cluster_name" {
  value = module.gke.cluster_name
}

output "cluster_endpoint" {
  value     = module.gke.cluster_endpoint
  sensitive = true
}

output "network_name" {
  value = module.vpc.network_name
}

output "ingress_ip" {
  description = "Cloudflare GSLB에 등록할 IP"
  value       = module.vpc.ingress_ip
}
