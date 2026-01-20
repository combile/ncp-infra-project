output "cluster_uuid" {
  description = "NKS cluster UUID"
  value       = ncloud_nks_cluster.this.uuid
}

output "cluster_name" {
  value = ncloud_nks_cluster.this.name
}

output "kubeconfig_endpoint" {
  description = "Kubernetes API endpoint"
  value       = ncloud_nks_cluster.this.endpoint
}
