# NCP Multi-Cloud DR Infrastructure

This repository contains Terraform-based infrastructure code for a
**multi-cloud disaster recovery (DR) architecture**.

The system is designed with an **Active–Standby (Warm) model**, where
Naver Cloud Platform (NCP) acts as the **primary active environment** and
Google Cloud Platform (GCP) operates as a **warm standby**.

---

## 🧱 Architecture Overview

- **Active Cloud**: Naver Cloud Platform (NKS)
- **Standby Cloud**: Google Cloud Platform (GKE)
- **Traffic Control**: Global DNS with weighted routing (planned)
- **Provisioning**: Terraform (IaC)
- **Deployment / Ops**: GitHub Actions (CI-based apply)

This repository currently focuses on provisioning the **NCP Active infrastructure**,
which serves as the primary Kubernetes cluster in the DR topology.

---

## 📁 Repository Structure

```text
terraform/
├─ live/
│  ├─ ncp-active/        # NCP Active infrastructure (VPC + NKS)
│  ├─ gcp-standby/       # GCP Standby infrastructure (managed separately)
│  └─ global/            # Global DNS / routing (planned)
└─ modules/
   ├─ ncp/
   │  ├─ vpc/            # NCP VPC & subnet module
   │  └─ nks/            # NCP Kubernetes Service (NKS) module
   └─ gcp/
