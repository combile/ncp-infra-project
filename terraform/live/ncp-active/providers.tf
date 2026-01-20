terraform {
  required_version = ">= 1.5.0"

  required_providers {
    ncloud = {
      source  = "navercloudplatform/ncloud"
      version = ">= 2.0.0"
    }
  }
}

provider "ncloud" {
  support_vpc = true
  region      = var.region
}
