variable "lb_arn" {
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  type = string
}

variable "tg_arn" {
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  type = string
}

variable "certificate_arn" {
  default = null
}

variable "listner_details" {
  description = "List of some Listner details here"
}
