output "network_name" {
  value = google_compute_network.main.name
}

output "network_id" {
  value = google_compute_network.main.id
}

output "subnet_name" {
  value = google_compute_subnetwork.main.name
}

output "subnet_id" {
  value = google_compute_subnetwork.main.id
}

output "pods_secondary_range_name" {
  value = "pods"
}

output "services_secondary_range_name" {
  value = "services"
}

output "ingress_ip" {
  description = "Ingress용 고정 IP 주소"
  value       = google_compute_global_address.ingress.address
}
