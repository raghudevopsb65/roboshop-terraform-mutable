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
  ENGINE             = var.RDS_ENGINE
  ENGINE_VERSION     = var.RDS_ENGINE_VERSION
  RDS_INSTANCE_CLASS = var.RDS_INSTANCE_CLASS
  PG_FAMILY          = var.RDS_PG_FAMILY
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  RDS_PORT           = var.RDS_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
}

module "DOCDB" {
  source             = "github.com/raghudevopsb65/tf-module-docdb"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  ENGINE             = var.DOCDB_ENGINE
  ENGINE_VERSION     = var.DOCDB_ENGINE_VERSION
  INSTANCE_CLASS     = var.DOCDB_INSTANCE_CLASS
  PG_FAMILY          = var.DOCDB_PG_FAMILY
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  PORT               = var.DOCDB_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
  NUMBER_OF_NODES    = var.DOCDB_NUMBER_OF_NODES
}

module "ELASTICACHE" {
  source             = "github.com/raghudevopsb65/tf-module-elasticache"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  ENGINE             = var.ELASTICACHE_ENGINE
  ENGINE_VERSION     = var.ELASTICACHE_ENGINE_VERSION
  INSTANCE_CLASS     = var.ELASTICACHE_INSTANCE_CLASS
  PG_FAMILY          = var.ELASTICACHE_PG_FAMILY
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  PORT               = var.ELASTICACHE_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
  NUMBER_OF_NODES    = var.ELASTICACHE_NUMBER_OF_NODES
}

module "RABBITMQ" {
  source             = "github.com/raghudevopsb65/tf-module-rabbitmq"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  PORT               = var.RABBITMQ_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
  INSTANCE_TYPE      = var.RABBITMQ_INSTANCE_TYPE
  WORKSTATION_IP     = var.WORKSTATION_IP
}

module "LB" {
  source             = "github.com/raghudevopsb65/tf-module-mutable-lb"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
  PUBLIC_SUBNET_IDS  = module.VPC.PUBLIC_SUBNET_IDS
}

module "FRONTEND" {
  source             = "github.com/raghudevopsb65/tf-module-mutable-app"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
  PORT               = 80
  COMPONENT          = "frontend"
  INSTANCE_TYPE      = "t3.micro"
}

