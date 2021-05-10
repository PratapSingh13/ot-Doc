#Variables for Security Group
variable "sg_name" {
  description = "Name of your Security Group"
  type        = string
  default     = "da-test-sg"
}

variable "vpc_id" {
  description = "Give your vpc id here"
  type        = string
  default     = "vpc-0391267e62cf0cff1"
}

#Variables for TargetGroup
variable "target_group_details" {
  description = "Some essential details of TargetGroup"
  type        = map(any)
  default     = {
    target_group_name     = "da-TG"
    target_group_port     = 80
    target_group_protocol = "HTTP"
    target_type           = "instance"
  }
}

variable "healthy_threshold" {
  description = "Number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 10
}

variable "unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering the target unhealthy"
  type        = number
  default     = 10
}

variable "timeout" {
  description = "Amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 3
}

variable "interval" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Path to health-check"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Port to health-check"
  type        = number
  default     = 80
}

variable "deregistration_delay" {
  description = "Amount time for Load Balancing to wait before changing the state of a deregistering target from draining to unused"
  type        = number
  default     = 90
}

variable "slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests"
  type        = number
  default     = 100
}

#Variable for TargetGroup attachment
variable "target_ids" {
  description = "This is the TargetID where TG will attach"
  type        = list(string)
  default     = ["i-069894aabebcd6b23", "i-08ed634a42bc9859a"]
}

# Variables for ALB
variable "alb_name" {
  description = "Name for Load Balancer"
  type        = string
  default     = "da-alb"
}

variable "internal" {
  description = "Internal for Load Balancer"
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Protection from deletion"
  type        = bool
  default     = false
}

variable "subnets_id" {
  description = "Give SubnetIDs"
  type        = list(string)
  default     = ["subnet-019228e2e83037c84", "subnet-00c5f377a8c037c6a"]
}

# variable "alb_security_groups_ids" {
#   description = "A list of Security Groups"
#   type        = list(string)
#   default     = ["sg-087b864592b3fd821"]
# }

variable "alb_tags" {
  description = "Resource Tags"
  type        = map(string)
  default = {
    Name = "da_alb"
  }
}

variable "drop_invalid_header_fields" {
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false."
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "alb_log_bucket" {
  description = "Bucket name for alb logs store"
  type        = string
  default     = "final-tf-state"
}

variable "alb_enable_logging" {
  description = "Do you want to enable logging"
  type        = bool
  default     = true
}

#Variables for ALB Listeners
variable "listener_details" {
  description = "List of some Listener details here"
  type        = map(any)
  default     = {
    forward_protocol = "HTTP"
    ssl_policy       = ""
    certificate_arn  = ""
  }
}

# variable "target_group_arn" {
#   description = "Put Target Group arn value"
#   type        = string
#   #default     = "arn:aws:elasticloadbalancing:us-east-1:836096864812:targetgroup/da-TG/2827a5c3253e780f"
# }
