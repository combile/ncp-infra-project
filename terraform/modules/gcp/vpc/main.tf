terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = ">= 4.0"
        }
    }
}


# MARK: VPC 생성
resource "google_compute_network" "main" {
    name = var.network_name # vpc 이름
    project = var.project_id
    auto_create_subnetworks = false # 서브넷 자동 생성 X
    routing_mode = "GLOBAL" # 전역 라우팅(리전 간 통신 가능)
}


# MARK: 서브넷 생성
resource "google_compute_subnetwork" "main" {
    name = var.subnet_name
    project = var.project_id
    region = var.region
    network = google_compute_network.main.id # vpc 연결
    ip_cidr_range = var.subnet_cidr # NOTE: 서브넷 사이더(ip대역 설정)
    private_ip_google_access = true 

    # gke pod용
    secondary_ip_range {
        range_name = "pods"
        ip_cidr_range = var.pods_cidr
    }
    
    # gke service용
    secondary_ip_range {
        range_name = "services"
        ip_cidr_range = var.services_cidr
    }
}

# MARK: 내부 통신 허용
resource "google_compute_firewall" "allow_internal" {
  name    = "${var.network_name}-allow-internal"    # 방화벽 규칙 이름
  project = var.project_id
  network = google_compute_network.main.id          # 적용할 VPC
  allow {
    protocol = "icmp"                               # ping 허용
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]                          # 모든 TCP 포트 허용
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]                          # 모든 UDP 포트 허용
  }
  source_ranges = [var.subnet_cidr, var.pods_cidr, var.services_cidr]  # VPC 내부 대역
}


# MARK: ssh 연결 허용(iap)
resource "google_compute_firewall" "allow_ssh_iap" {
  name    = "${var.network_name}-allow-ssh-iap"
  project = var.project_id
  network = google_compute_network.main.id
  allow {
    protocol = "tcp"
    ports    = ["22"]                               # SSH 포트
  }
  source_ranges = ["35.235.240.0/20"]               # Google IAP IP 대역
  target_tags   = ["allow-ssh"]                     
}

# MARK: gke-master
resource "google_compute_firewall" "allow_gke_webhook" {
  name    = "${var.network_name}-allow-gke-webhook"
  project = var.project_id
  network = google_compute_network.main.id
  allow {
    protocol = "tcp"
    ports    = ["443", "8443", "10250"]             # Webhook, Kubelet 포트
  }
  source_ranges = [var.master_ipv4_cidr]            # GKE Master(Control Plane) IP 대역
}

# MARK: gcp 헬스체크
resource "google_compute_firewall" "allow_health_check" {
  name    = "${var.network_name}-allow-health-check"
  project = var.project_id
  network = google_compute_network.main.id
  allow {
    protocol = "tcp"                                
  }
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]  # GCP 로드밸런서 헬스체크 IP
  target_tags   = ["gke-node"]                      # GKE 노드에만 적용
}

# MARK: Ingress용 고정 IP
resource "google_compute_global_address" "ingress" {
  name         = "${var.network_name}-ingress-ip"
  project      = var.project_id
  address_type = "EXTERNAL"
}