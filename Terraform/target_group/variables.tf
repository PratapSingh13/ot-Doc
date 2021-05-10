#Variables for target_group
variable "target_group_details" {
  description = "Some essential details of TargetGroup"
  type        = map(any)
}

variable "vpc_id" {
  description = "VPC ID for your TargetGroup"
  type        = string
}

variable "healthy_threshold" {
  description = "Number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering the target unhealthy"
  type        = number
  default     = 3
}

variable "timeout" {
  description = "Amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}

variable "interval" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 5
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
  default     = 300
}

variable "slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests"
  type        = number
  default     = 0
}

#Variables for target_group_attachment
variable "target_ids" {
  description = "Give targetid which you want to register with your TG"
  type        = list(string)
}

variable "port" {
  description = "Port on which instance will get registered in Target group"
  type        = number
  default     = 80
}

