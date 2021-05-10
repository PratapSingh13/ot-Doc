output "alb_arn" {
  value       = aws_lb.alb.arn
  description = "This is ALB arn"
}

output "alb_id" {
  description = "The ID of the ALB"
  value       = aws_lb.alb.id
}

output "alb_dns" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_zoneid" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)"
  value       = aws_lb.alb.zone_id
}

output "alb_forward_listener_arn" {
  value       = aws_lb_listener.alb_https_listener.arn
  description = "Alb https listener Arn"
}

