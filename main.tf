module "VPC" {
  source               = "github.com/raghudevopsb65/tf-module-vpc"
  ENV                  = var.ENV
  PROJECT              = var.PROJECT
  VPC_CIDR             = var.VPC_CIDR
  PUBLIC_SUBNETS_CIDR  = var.PUBLIC_SUBNETS_CIDR
  PRIVATE_SUBNETS_CIDR = var.PRIVATE_SUBNETS_CIDR
  AZ                   = var.AZ
  DEFAULT_VPC_ID       = var.DEFAULT_VPC_ID
  DEFAULT_VPC_CIDR     = var.DEFAULT_VPC_CIDR
  DEFAULT_VPC_RT       = var.DEFAULT_VPC_RT
}

module "RDS" {
  source             = "github.com/raghudevopsb65/tf-module-rds"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  ENGINE             = var.ENGINE
  ENGINE_VERSION     = var.ENGINE_VERSION
  RDS_INSTANCE_CLASS = var.RDS_INSTANCE_CLASS
  PG_FAMILY          = var.PG_FAMILY
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNETS_IDS
  VPC_ID             = module.VPC.VPC_ID
  RDS_PORT           = var.RDS_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNETS_IDS
}

