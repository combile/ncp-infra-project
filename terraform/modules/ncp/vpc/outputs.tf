output "vpc_no" {
  description = "VPC ID"
  value       = ncloud_vpc.this.id
}

output "default_network_acl_no" {
  description = "Default Network ACL No"
  value       = ncloud_vpc.this.default_network_acl_no
}

output "node_subnet_no" {
  description = "Subnet for NKS worker nodes"
  value       = ncloud_subnet.node.id
}

output "lb_private_subnet_no" {
  description = "Private LB subnet for NKS"
  value       = ncloud_subnet.lb_private.id
}

output "lb_public_subnet_no" {
  description = "Public LB subnet for NKS"
  value       = ncloud_subnet.lb_public.id
}
