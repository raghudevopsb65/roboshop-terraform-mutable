module "VPC" {
  source   = "github.com/raghudevopsb65/tf-module-vpc"
  ENV      = var.ENV
  PROJECT  = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
}
