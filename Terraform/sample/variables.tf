#Variables for Security Group
variable "sg_name" {
  description = "Name of your Security Group"
  type        = string
  default     = "da-test-sg"
}

variable "vpc_id" {
  description = "Give your vpc id here"
  type        = string
  default     = "vpc-0391267e62cf0cff"
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

# variable "alb_log_bucket" {
#   description = "Bucket name for alb logs store"
#   type        = string
#   default     = "final-tf-state"
# }

# variable "alb_enable_logging" {
#   description = "Do you want to enable logging"
#   type        = bool
#   default     = false
# }

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

################################################
## Additional tag
################################################
variable "additional_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of launch template"
  default = {
    Owner       = "Siddharth Gupta"
    Location    = "Noida"
    Create_By   = "Siddharth Gupta"
    Reviewed_By = "Rajat Vats"
  }
}
variable "additional_tags_asg" {
  type        = list(map(string))
  description = "These are the additional tags associated with the main tag of auto scaling group"
  default = [{
    key                 = "Owner"
    value               = "Siddharth Gupta"
    propagate_at_launch = true
    }, {
    key                 = "Location"
    value               = "Noida"
    propagate_at_launch = true
    },
    {
      key                 = "Create_By"
      value               = "Siddharth Gupta"
      propagate_at_launch = true
    },
    {
      key                 = "Reviewed_By"
      value               = "Rajat Vats"
      propagate_at_launch = true
    }
  ]
}
################################################
## Launch Template module variables
################################################
variable "launch_template_name" {
  type        = string
  default     = "docasap_launch_template"
  description = "The default launch template name"
}

variable "iam_instance_profile_arn" {
  type        = string
  default     = ""
  description = "The IAM Instance Profile to launch the instance with"
}

variable "ami_id" {
  type        = string
  default     = "ami-09e67e426f25ce0d7"
  description = "The default ami id that user wants to associate with the launch template"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The default instance type (like micro, medium, large)  that user wants to associate with the launch template"
}

variable "key_name" {
  type        = string
  default     = "awsKey"
  description = "The default key that user wants to associate with the launch template's instance"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = ["sg-0d500ab4aadfda95a"]
  description = "The default list of security group that the user wants to associate with the launch template"
}

variable "launch_template" {
  type        = string
  default     = ""
  description = "The default launch template id that user wants to associate with the launch template"
}
################################################
##Auto Scaling Group module variables
################################################

variable "asg_name" {
  type        = string
  default     = "docasap_asg"
  description = "The default auto-scaling group name"
}

variable "max_size" {
  type        = string
  default     = "2"
  description = "The maximum size of the Auto Scaling Group"
}

variable "min_size" {
  type        = string
  default     = "2"
  description = "The minimum size of the Auto Scaling Group"
}

variable "desired_capacity" {
  type        = string
  default     = "2"
  description = "The number of Amazon EC2 instances that should be running in the group"
}

# # variable "pvt_subnet_ids" {
# #   type        = list(string)
# #   default     = ["subnet-04fc11b60e20beb93", "subnet-028a00b61cec61b9d"]
# #   description = "The list of subnet ids associated with the auto scaling group"
# # }

# # variable "target_group_arn" {
# #   type    = string
# #   default = ""
# #   #default     = "arn:aws:elasticloadbalancing:ap-south-1:869140109150:targetgroup/docasap-alb-tg/501e3bb7956c5a26"
# #   description = "A aws_alb_target_group ARNs, for use with Application or Network Load Balancing"
# # }

variable "lt_description" {
  type        = string
  default     = "sample docasap launch template"
  description = "Description of the launch template."
}
