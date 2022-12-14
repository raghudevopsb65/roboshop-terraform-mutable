ENV            = "prod"
PROJECT        = "roboshop"
WORKSTATION_IP = "172.31.2.126/32"
PROMETHEUS_IP  = "172.31.14.82/32"

// VPC
VPC_CIDR             = "10.100.0.0/16"
PUBLIC_SUBNETS_CIDR  = ["10.100.0.0/24", "10.100.1.0/24"]
PRIVATE_SUBNETS_CIDR = ["10.100.2.0/24", "10.100.3.0/24"]
AZ                   = ["us-east-1a", "us-east-1b"]
DEFAULT_VPC_ID       = "vpc-075435ce9af088bfa"
DEFAULT_VPC_CIDR     = "172.31.0.0/16"
DEFAULT_VPC_RT       = "rtb-032742c71bcb7a780"
PRIVATE_ZONE_ID      = "Z080600234ZUEKDP4RGN8"
PUBLIC_ZONE_ID       = "Z102210128E9XU3WM3P6X"

// RDS
RDS_ENGINE         = "mysql"
RDS_ENGINE_VERSION = "5.7"
RDS_INSTANCE_CLASS = "db.t3.micro"
RDS_PG_FAMILY      = "mysql5.7"
RDS_PORT           = 3306

// DOCDB
DOCDB_ENGINE          = "docdb"
DOCDB_ENGINE_VERSION  = "4.0.0"
DOCDB_INSTANCE_CLASS  = "db.t3.medium"
DOCDB_PG_FAMILY       = "docdb4.0"
DOCDB_PORT            = 27017
DOCDB_NUMBER_OF_NODES = 1

// ELASTICACHE
ELASTICACHE_ENGINE          = "redis"
ELASTICACHE_ENGINE_VERSION  = "6.2"
ELASTICACHE_INSTANCE_CLASS  = "cache.t3.small"
ELASTICACHE_PG_FAMILY       = "redis6.x"
ELASTICACHE_PORT            = 6379
ELASTICACHE_NUMBER_OF_NODES = 1

// RABBITMQ
RABBITMQ_INSTANCE_TYPE = "t3.micro"
RABBITMQ_PORT          = 5672

//
INSTANCE_COUNT = {
  FRONTEND = {
    COUNT         = 2
    INSTANCE_TYPE = "t3.micro"
  }
  USER = {
    COUNT         = 2
    INSTANCE_TYPE = "t3.micro"
  }
  CATALOGUE = {
    COUNT         = 2
    INSTANCE_TYPE = "t3.micro"
  }
  CART = {
    COUNT         = 2
    INSTANCE_TYPE = "t3.micro"
  }
  SHIPPING = {
    COUNT         = 3
    INSTANCE_TYPE = "t3.medium"
  }
  PAYMENT = {
    COUNT         = 2
    INSTANCE_TYPE = "t3.micro"
  }
}
