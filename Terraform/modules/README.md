# Application Load Balancer with Listners and TargetGroup

## This module will create a Load Balancer along side a variety of related resources, including: 
 - Application Load Balancer 
 - Listners
 - TargetGroup 
 - TargetGroup Attachment

Example Usage
```hcl
module "alb" {
  source                     = "/modules/alb/"
  alb_name                   = var.alb_name
  internal                   = var.internal
  alb_security_groups_ids    = var.alb_security_groups_ids
  subnets_id                 = var.subnets_id
  enable_deletion_protection = var.enable_deletion_protection
  lb_tags                    = var.alb_tags_map
}

module "targetGroup" {
  source               = "/modules/targetGroup/"
  target_group_details = var.tg_details
  vpc_ID               = var.vpc_ID
}

module "tgattachment" {
  source    = "/modules/targetGroupAttachment/"
  count     = length(var.targetid)
  target_id = var.target_id[count.index]
  tg_arn    = module.targetGroup.tg_arn
  port      = 80
}

module "alb_listener" {
  source          = "/modules/albListner/"
  lb_arn          = module.alb.alb_arn
  tg_arn          = module.targetGroup.tg_arn
  listner_details = var.listner_details
}
```

## Variables

- `alb_name` - Name of the Load Balancer
- `internal` - Internal for Load Balancer (either `true` or `false`)
- `alb_security_groups_ids` - A list of Security Group IDs
- `subnets_id` - List of Subnet IDs (Note-: `Use every subnets from different AZs`)
- `enable_deletion_protection` - Protecting from deletion
- `alb_tags_map` - List of some ALB tags (Ex- `Name`)
- `tg_details` - List of Target Group details (default: `tgname` `tgport` `tgprotocol` `target_type`) 
- `vpc_ID` - Provide VPC ID (Ex- `"vpc-0391267e62cf0cff1"`)
- `target_id` - List of Target IDs which you want to register with your Target Group (Ex- `["i-069894aabebcd6b23", "i-08ed634a42bc9859a"]`)
- `listner_details` - List of Listner details (Ex- `forwardprotocol = "HTTP"`)
