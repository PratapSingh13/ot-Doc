resource "aws_lb_listener" "forward" {
  load_balancer_arn = var.lb_arn
  port              = 80
  protocol          = "HTTP"
  ssl_policy        = var.listner_details["forwardprotocol"] == "HTTP" ? null : var.listner_details["sslpolicy"]
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.tg_arn
  }
}

resource "aws_lb_listener" "redirect" {
  count             = var.listner_details["forwardprotocol"] == "HTTPS" ? 1 : 0
  load_balancer_arn = var.lb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
