terraform {
  required_providers {
    ncloud = {
      source  = "navercloudplatform/ncloud"
      version = ">= 2.0.0"
    }
  }
}

# nks 버전 조회
data "ncloud_nks_versions" "this" {
  hypervisor_code = "KVM"

  filter {
    name   = "value"
    values = [var.nks_version]
    regex  = true
  }
}

# Login Key (노드 접근용) 
# 이미 존재하는 키 쓰고 싶으면 리소스 제거하고 login_key_name만 변수로 받아도 됨
resource "ncloud_login_key" "this" {
  key_name = var.login_key_name
}

# NKs Cluster
resource "ncloud_nks_cluster" "this" {
  name                 = var.cluster_name
  hypervisor_code      = "KVM"
  cluster_type         = "SVR.VNKS.STAND.C002.M008.G003"
  k8s_version          = data.ncloud_nks_versions.this.versions[0].value

  login_key_name       = ncloud_login_key.this.key_name
  vpc_no               = var.vpc_no
  subnet_no_list       = [var.node_subnet_no]

  lb_private_subnet_no = var.lb_private_subnet_no
  lb_public_subnet_no  = var.lb_public_subnet_no

  kube_network_plugin  = "cilium"
  public_network       = false
  zone                 = var.zone
  auth_type            = "API"
}

# Node Image / Spec 조회
data "ncloud_nks_server_images" "this" {
  hypervisor_code = "KVM"

  filter {
    name   = "label"
    values = ["ubuntu-22.04"]
    regex  = true
  }
}

data "ncloud_nks_server_products" "this" {
  software_code = data.ncloud_nks_server_images.this.images[0].value
  zone          = var.zone

  filter {
    name   = "product_type"
    values = ["STAND"]
  }

  filter {
    name   = "cpu_count"
    values = ["2"]
  }

  filter {
    name   = "memory_size"
    values = ["8GB"]
  }
}

# Node Pool
# 오토스케일 일단 OFF 후에 확장 및 검증 예정
resource "ncloud_nks_node_pool" "this" {
  cluster_uuid     = ncloud_nks_cluster.this.uuid
  node_pool_name   = "default-pool"
  node_count       = var.node_count

  software_code    = data.ncloud_nks_server_images.this.images[0].value
  server_spec_code = data.ncloud_nks_server_products.this.products[0].value
  storage_size     = 200

  autoscale {
    enabled = false
    min     = 0
    max     = 0
  }
}
