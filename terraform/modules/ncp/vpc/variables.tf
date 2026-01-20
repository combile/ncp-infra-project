variable "name" {
  description = "VPC name"
  type        = string
}

variable "region" {
  description = "Ncloud region"
  type        = string
  default     = "KR"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.10.0.0/16"
} 

variable "node_subnet_cidr" {
  description = "Subnet CIDR for NKS worker nodes (GEN, PRIVATE)"
  type        = string
  default     = "10.10.10.0/20"
}

variable "lb_private_subnet_cidr" {
  description = "Private LB subnet CIDR (LOADB)"
  type        = string
  default     = "10.10.100.0/24"
}

variable "lb_public_subnet_cidr" {
  description = "Public LB subnet CIDR (LOADB)"
  type        = string
  default     = "10.10.101.0/24"
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "KR-1"
}