variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-northeast3"
}

variable "cluster_name" {
  type    = string
  default = "gcp-standby-cluster"
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "pods_range_name" {
  type    = string
  default = "pods"
}

variable "services_range_name" {
  type    = string
  default = "services"
}

variable "master_ipv4_cidr" {
  type    = string
  default = "172.16.0.0/28"
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 5
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "disk_size_gb" {
  type    = number
  default = 50
}
