variable "cluster_name" {
  description = "NKS cluster name"
  type        = string
}

variable "region" {
  type    = string
  default = "KR"
}

variable "zone" {
  type    = string
  default = "KR-1"
}

variable "vpc_no" {
  description = "VPC No from vpc module"
  type        = string
}

variable "node_subnet_no" {
  description = "Subnet No for NKS worker nodes"
  type        = string
}

variable "lb_private_subnet_no" {
  description = "Private LB subnet No"
  type        = string
}

variable "lb_public_subnet_no" {
  description = "Public LB subnet No"
  type        = string
}

variable "nks_version" {
  description = "Kubernetes version (regex supported)"
  type        = string
  default     = "1.27"
}

variable "login_key_name" {
  description = "Login key name for NKS nodes"
  type        = string
}

variable "node_count" {
  description = "Initial node count"
  type        = number
  default     = 2
}
