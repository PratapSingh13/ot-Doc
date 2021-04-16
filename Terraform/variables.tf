variable "region" {
  default = "ap-south-1"
}

variable "vpcCIDRBlock" {
  default = "10.0.0.0/16"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "vpcName" {
  default = "vpc-temp"
}
