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

