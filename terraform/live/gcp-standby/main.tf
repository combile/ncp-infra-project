terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}
 
provider "google" {
  project = var.project_id
  region  = var.region
}


module "vpc" {
  source = "../../modules/gcp/vpc"

  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
}

module "gke" {
  source = "../../modules/gcp/gke"

  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  network_name = module.vpc.network_name
  subnet_name  = module.vpc.subnet_name
}

