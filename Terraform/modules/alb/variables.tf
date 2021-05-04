# Variables for ALB
variable "alb_name" {
  description = "Name of ALB"
  type        = string
}

variable "internal" {
  description = "If internal then LB will be internal"
  type        = bool
}

variable "alb_security_groups_ids" {
  description = "Security groups to be associated with ALB"
  type        = list(string)
}

variable "subnets_id" {
  description = "A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value will for load balancers of type network will force a recreation of the resource"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable delete protection"
  type        = bool
}

variable "lb_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}


