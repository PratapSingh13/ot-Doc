output "alb_arn" {
  value       = aws_lb.da_alb.arn
  description = "This is ALB arn"
}

output "alb_id" {
  description = "The ID of the lALB"
  value       = aws_lb.da_alb.id
}

output "alb_dns" {
  description = "The DNS name of the ALB"
  value       = aws_lb.da_alb.dns_name
}

output "alb_zoneid" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)"
  value       = aws_lb.da_alb.zone_id
}

