terraform {
  required_providers {
    ncloud = {
      source  = "navercloudplatform/ncloud"
      version = ">= 2.0.0"
    }
  }
}


# VPC
resource "ncloud_vpc" "this" {
  name            = var.name
  ipv4_cidr_block = var.vpc_cidr
}

# NKS Node Subnet (GEN / PRIVATE)
resource "ncloud_subnet" "node" {
  vpc_no         = ncloud_vpc.this.id
  subnet         = var.node_subnet_cidr
  zone           = var.zone
  subnet_type    = "PRIVATE"
  usage_type     = "GEN"
  network_acl_no = ncloud_vpc.this.default_network_acl_no
  name           = "${var.name}-node"
}

# LB Private Subnet (LOADB / PRIVATE)
resource "ncloud_subnet" "lb_private" {
  vpc_no         = ncloud_vpc.this.id
  subnet         = var.lb_private_subnet_cidr
  zone           = var.zone
  subnet_type    = "PRIVATE"
  usage_type     = "LOADB"
  network_acl_no = ncloud_vpc.this.default_network_acl_no
  name           = "${var.name}-lb-private"
}

# LB Public Subnet (LOADB / PUBLIC)
resource "ncloud_subnet" "lb_public" {
  vpc_no         = ncloud_vpc.this.id
  subnet         = var.lb_public_subnet_cidr
  zone           = var.zone
  subnet_type    = "PUBLIC"
  usage_type     = "LOADB"
  network_acl_no = ncloud_vpc.this.default_network_acl_no
  name           = "${var.name}-lb-public"
}
