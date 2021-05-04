resource "aws_lb_target_group" "da_tg" {
  name        = var.target_group_details["tgname"]
  port        = var.target_group_details["tgport"]
  protocol    = var.target_group_details["tgprotocol"]
  target_type = var.target_group_details["target_type"]
  vpc_id      = var.vpc_ID
}
