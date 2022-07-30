ENV     = "dev"
PROJECT = "roboshop"

// VPC
VPC_CIDR             = "10.50.0.0/16"
PUBLIC_SUBNETS_CIDR  = ["10.50.0.0/24", "10.50.1.0/24"]
PRIVATE_SUBNETS_CIDR = ["10.50.2.0/24", "10.50.3.0/24"]
AZ                   = ["us-east-1a", "us-east-1b"]
DEFAULT_VPC_ID       = "vpc-075435ce9af088bfa"
DEFAULT_VPC_CIDR     = "172.31.0.0/16"
DEFAULT_VPC_RT       = "rtb-032742c71bcb7a780"

// RDS
RDS_ENGINE         = "mysql"
RDS_ENGINE_VERSION = "5.7"
RDS_INSTANCE_CLASS = "db.t3.micro"
RDS_PG_FAMILY      = "mysql5.7"
RDS_PORT           = 3306

// DOCDB
DOCDB_ENGINE         = "docdb"
DOCDB_ENGINE_VERSION = "4.0.0"
DOCDB_INSTANCE_CLASS = "db.t3.medium"
DOCDB_PG_FAMILY      = "docdb4.0"
DOCDB_PORT           = 27107
