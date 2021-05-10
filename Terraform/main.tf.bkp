# Providing the AWS Credentials
provider "aws" {
    profile    = "default"
    region     = var.region
    version    = "~> 2.12.0"
}

# Creating VPC
resource "aws_vpc" "My_VPC" {
  cidr_block           = var.vpcCIDRBlock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames

  tags = {
      Name = var.vpcName
  }
}
