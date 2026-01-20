variable "region" {
  type    = string
  default = "KR"
}

variable "zone" {
  type    = string
  default = "KR-1"
}

############################
# VPC
############################
variable "vpc_name" {
  type    = string
  default = "ncp-active-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "node_subnet_cidr" {
  type    = string
  default = "10.10.16.0/20"
}

variable "lb_private_subnet_cidr" {
  type    = string
  default = "10.10.100.0/24"
}

variable "lb_public_subnet_cidr" {
  type    = string
  default = "10.10.101.0/24"
}

############################
# NKS
############################
variable "cluster_name" {
  type    = string
  default = "ncp-active-nks"
}

variable "nks_version" {
  description = "regex supported 1.33.4"
  type        = string
  default     = "1.33\\..*"
}

variable "login_key_name" {
  type    = string
  default = "ncp-active-login-key"
}

variable "node_count" {
  type    = number
  default = 2
}
