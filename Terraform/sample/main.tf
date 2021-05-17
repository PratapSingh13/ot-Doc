module "security_group" {
  source       = "../security_group"
  sg_name      = var.sg_name
  vpc_id       = var.vpc_iD
  sg_name_tag  = "test-sg" 
  sg_ingress   = [
    {
      description      = "For HTTPS request at port 443"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/24"]
      self             = false
      security_groups  = []
    },
    {
      description      = "For HTTP request at port 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/24"]
      self             = true
      security_groups  = []
    },
    {
      description      = "For SSH request at port 22"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/24"]
      self             = false
      security_groups  = []
    }
  ]

  sg_egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = -1
      cidr_blocks      = ["0.0.0.0/0"]
      self             = false
      security_groups  = []
    }
  ]
}

# module "target_group_and_target_group_attachment" {
#   source               = "github.com/PratapSingh13/ot-DocASAP//Terraform/target_group"
#   target_group_details = var.target_group_details
#   vpc_id               = var.vpc_id
#   healthy_threshold    = var.healthy_threshold
#   unhealthy_threshold  = var.unhealthy_threshold
#   timeout              = var.timeout
#   interval             = var.interval
#   health_check_path    = var.health_check_path
#   health_check_port    = var.health_check_port
#   deregistration_delay = var.deregistration_delay
#   slow_start           = var.slow_start
#   target_ids           = var.target_ids
#   port                 = 80
# }
  
# module "alb_and_alb_listeners" {
#   source                                = "github.com/PratapSingh13/ot-DocASAP//Terraform/alb"
#   alb_name                              = var.alb_name
#   internal_alb                          = var.internal
#   alb_security_groups_ids               = [module.security_group.sg_id]
#   subnets_id                            = var.subnets_id
#   enable_deletion_protection            = var.enable_deletion_protection
#   drop_invalid_header_fields            = var.drop_invalid_header_fields
#   idle_timeout                          = var.idle_timeout
#   alb_tags                              = var.alb_tags
# #   alb_log_bucket                        = var.alb_log_bucket
# #  alb_enable_logging                    = var.alb_enable_logging
#   target_group_arn                      = module.target_group_and_target_group_attachment.target_group_arn
#   listener_details                      = var.listener_details
# }

# module "lt_and_asg" {
#   # details for launch template
#   source                 = "github.com/PratapSingh13/ot-DocASAP//Terraform/asg"
#   lt_name                = var.launch_template_name
#   ami_id                 = var.ami_id
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   vpc_security_group_ids = [module.security_group.sg_id]
#   lt_tags                = var.additional_tags
#   iam_instance_profile = [{
#     arn = var.iam_instance_profile_arn
#   }]
#   lt_description = var.lt_description
#   user_data      = filebase64("../asg/script.sh")

#   # details for auto scaling group
#   asg_name         = var.asg_name
#   max_size         = var.max_size
#   min_size         = var.min_size
#   desired_capacity = var.desired_capacity
#   subnet_ids       = var.subnets_id
#   asg_tags         = var.additional_tags_asg
#   target_group_arn = module.target_group_and_target_group_attachment.target_group_arn
# }

