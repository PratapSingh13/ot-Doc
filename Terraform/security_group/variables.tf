variable "sg_name" {
  description = "Give the name of your SecurityGroup"
  type        = string
  default     = "tf-SG"
}

variable "sg_name_tag" {
  default     = "test-sg"
  type        = string
  description = "This is Security Group tag name"
}

variable "vpc_id" {
  description = "Give your VPC Id for Security Group"
  type        = string
}

variable "sg_ingress" {
  description = "List of Ingerss Ports and CIDRs"
  type = list(object(
    {
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      self            = bool
      security_groups = list(string)
    }
  ))

}

variable "sg_egress" {
  description = "Egress Ports and CIDRs"
  type = list(object(
    {
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      self            = bool
      security_groups = list(string)
    }
  ))
}
