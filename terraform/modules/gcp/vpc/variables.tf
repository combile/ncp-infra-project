variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-northeast3"
}

variable "network_name" {
  type    = string
  default = "gcp-standby-vpc"
}

variable "subnet_name" {
  type    = string
  default = "gcp-standby-subnet"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pods_cidr" {
  type    = string
  default = "10.4.0.0/14"
}

variable "services_cidr" {
  type    = string
  default = "10.8.0.0/20"
}

variable "master_ipv4_cidr" {
  type    = string
  default = "172.16.0.0/28"
}
