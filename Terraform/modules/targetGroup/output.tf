output "tg_arn"{
    value = aws_lb_target_group.da_tg.arn
    description = "This is TargetGroup arn"
}
