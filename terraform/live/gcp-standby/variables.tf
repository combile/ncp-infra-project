variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "network_name" {
  type        = string
  description = "VPC Network Name"
}

variable "cluster_name" {
  type        = string
  description = "GKE Cluster Name"
}
