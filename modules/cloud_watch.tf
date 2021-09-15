#CloudWatch Alarams Configuration

resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.scale_up_policy_name
  scaling_adjustment     = var.scale_up_scaling_adjustment
  adjustment_type        = var.scale_up_adjustment_type
  cooldown               = var.scale_up_cooldown_seconds
  policy_type            = var.scale_up_policy_type
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.scale_down_policy_name
  scaling_adjustment     = var.scale_down_scaling_adjustment
  adjustment_type        = var.scale_down_adjustment_type
  cooldown               = var.scale_down_cooldown_seconds
  policy_type            = var.scale_down_policy_type
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_cloudwatch_metric_alarm" "alarms" {
  for_each          = local.all_alarms
  alarm_name        = each.value.alarm_name
  alarm_description = each.value.alarm_description
  alarm_actions     = each.value.alarm_actions

  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = each.value.namespace
  period              = each.value.period
  statistic           = each.value.statistic
  threshold           = each.value.threshold

  dimensions = {
    (each.value.dimensions_name) = (each.value.dimensions_target)
  }

  tags = local.common_tags
}
