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

# Creating IGW
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
      Name = var.InternetGateWay
  }
}

# Using Data-Source for retrieving AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating Subnet
# Creating Public Subnet
resource "aws_subnet" "Public-Subnet" {
  vpc_id                  = aws_vpc.My_VPC.id
  cidr_block              = var.Public-Subnet-AZ-A
  map_public_ip_on_launch = var.mapPublicIP

  tags = {
      Name = "${var.subnet-public}"
  }

  availability_zone = data.aws_availability_zones.available.names[0]
}

# Creating Route-Table for Public Subnet
resource "aws_route_table" "Public-Route" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
      Name = var.publicRouteTableName
  }

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.IGW.id
  }
}

# Associating Route-Table with Public
resource "aws_route_table_association" "Public_AZ-A" {
  subnet_id      = aws_subnet.Public-Subnet.id
  route_table_id = aws_route_table.Public-Route.id
  depends_on     = [aws_route_table.Public-Route, aws_subnet.Public-Subnet]
}

# Creating Security Group
resource "aws_security_group" "My_VPC_Security_Group" {
  vpc_id      = aws_vpc.My_VPC.id
  name        = "My_VPC_Security_Group"
  description = "This is my VPC Security Group"
}

# Ingress Security Port 22
resource "aws_security_group_rule" "Inbound" {
  cidr_blocks       = var.ingressCIDRBlock
  from_port         = var.ingress_from_Port
  to_port           = var.ingress_to_Port
  protocol          = var.ingressProtocol
  type              = var.ingressType
  security_group_id = aws_security_group.My_VPC_Security_Group.id
}

# All OutBound access
resource "aws_security_group_rule" "Outbound" {
  cidr_blocks       = var.egressCIDRBlock
  from_port         = var.egress_from_port
  to_port           = var.egress_to_port
  protocol          = var.egressProtocol
  type              = var.egressType
  security_group_id = aws_security_group.My_VPC_Security_Group.id
}

# Creating EC2 Instance Using Public Subnet
resource "aws_instance" "ubuntu-pub" {
  ami                         = var.amiID
  instance_type               = var.instanceType
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.available.names[0]
  count                       = var.instanceCount
  subnet_id                   = aws_subnet.Public-Subnet.id
  user_data                   = var.userData
  tenancy                     = var.tenancy
  monitoring                  = var.monitoring
  key_name                    = "ASGKEY"
  security_groups             = [aws_security_group.My_VPC_Security_Group.id]

  tags = {
    Name = var.publicInstanceName
  }
}
