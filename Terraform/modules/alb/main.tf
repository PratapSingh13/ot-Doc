resource "aws_lb" "da_alb" {
  name                       = var.alb_name
  internal                   = var.internal
  load_balancer_type         = "application"
  security_groups            = var.alb_security_groups_ids
  subnets                    = var.subnets_id
  enable_deletion_protection = var.enable_deletion_protection
  tags                       = var.lb_tags
}
