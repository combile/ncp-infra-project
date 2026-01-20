############################
# VPC (Primary - Ncloud)
############################
module "vpc" {
  source = "../../modules/ncp/vpc"

  name   = var.vpc_name
  region = var.region
  zone   = var.zone

  vpc_cidr               = var.vpc_cidr
  node_subnet_cidr       = var.node_subnet_cidr
  lb_private_subnet_cidr = var.lb_private_subnet_cidr
  lb_public_subnet_cidr  = var.lb_public_subnet_cidr
}

############################
# NKS Cluster
############################
module "nks" {
  source = "../../modules/ncp/nks"

  cluster_name = var.cluster_name
  region       = var.region
  zone         = var.zone

  vpc_no               = module.vpc.vpc_no
  node_subnet_no       = module.vpc.node_subnet_no
  lb_private_subnet_no = module.vpc.lb_private_subnet_no
  lb_public_subnet_no  = module.vpc.lb_public_subnet_no

  nks_version    = var.nks_version
  login_key_name = var.login_key_name
  node_count     = var.node_count
}
