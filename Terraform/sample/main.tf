module "security_group" {
  source       = "github.com/PratapSingh13/ot-DocASAP//Terraform"
  sg_name      = var.sg_name
  vpc_id       = var.vpc_id
   sg_name_tag = "test-sg" 
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
  
module "target_group_and_target_group_attachment" {
  source               = "https://gitlab.com/ot-client/docasap/tf-modules/target_group.git"
  target_group_details = var.target_group_details
  vpc_id               = var.vpc_id
  healthy_threshold    = var.healthy_threshold
  unhealthy_threshold  = var.unhealthy_threshold
  timeout              = var.timeout
  interval             = var.interval
  health_check_path    = var.health_check_path
  health_check_port    = var.health_check_port
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start
  target_ids           = var.target_ids
  port                 = 80
}

