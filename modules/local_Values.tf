#ECS Local Values

locals {
  ec2_alarms = {
    cpu_high = {
      alarm_name                = "CPUUtilizationAlarmHighEC2"
      comparison_operator       = "GreaterThanOrEqualToThreshold"
      evaluation_periods        = var.cpu_utilization_high_evaluation_periods
      metric_name               = "CPUUtilization"
      namespace                 = "aws/EC2"
      period                    = var.cpu_utilization_high_period_seconds
      statistic                 = var.cpu_utilization_high_statistic
      threshold                 = var.cpu_utilization_high_threshold_percent
      dimensions_name           = "AutoScalingGroupName"
      dimensions_target         = aws_autoscaling_group.asg.name
      alarm_description         = "Scale up if CPU utilization is above ${var.cpu_utilization_high_threshold_percent} for ${var.cpu_utilization_high_period_seconds} seconds"
      alarm_actions             = [aws_autoscaling_policy.scale_up.arn]
      treat_missing_data        = "missing"
      ok_actions                = []
      insufficient_data_actions = []

    },
    cpu_low = {
      alarm_name                = "CPUUtilizationLowEC2"
      comparison_operator       = "LessThanOrEqualToThreshold"
      evaluation_periods        = var.cpu_utilization_low_evaluation_periods
      metric_name               = "CPUUtilization"
      namespace                 = "aws/EC2"
      period                    = var.cpu_utilization_low_period_seconds
      statistic                 = var.cpu_utilization_low_statistic
      threshold                 = var.cpu_utilization_low_threshold_percent
      dimensions_name           = "AutoScalingGroupName"
      dimensions_target         = aws_autoscaling_group.asg.name
      alarm_description         = "Scale down if the CPU utilization is below ${var.cpu_utilization_low_threshold_percent} for ${var.cpu_utilization_low_period_seconds} seconds"
      alarm_actions             = [aws_autoscaling_policy.scale_down.arn]
      treat_missing_data        = "missing"
      ok_actions                = []
      insufficient_data_actions = []
    },
    mem_high = {
      alarm_name                = "MemUtilizationAlarmHighEC2"
      comparison_operator       = "GreaterThanOrEqualToThreshold"
      evaluation_periods        = var.mem_utilization_high_evaluation_periods
      metric_name               = "MemoryUtilization"
      namespace                 = "aws/EC2"
      period                    = var.mem_utilization_high_period_seconds
      statistic                 = var.mem_utilization_high_statistic
      threshold                 = var.mem_utilization_high_threshold_percent
      dimensions_name           = "AutoScalingGroupName"
      dimensions_target         = aws_autoscaling_group.asg.name
      alarm_description         = "Scale up if Memory utilization is above ${var.mem_utilization_high_threshold_percent} for ${var.mem_utilization_high_period_seconds} seconds"
      alarm_actions             = [aws_autoscaling_policy.scale_up.arn]
      treat_missing_data        = "missing"
      ok_actions                = []
      insufficient_data_actions = []

    },
    mem_low = {
      alarm_name                = "MemUtilizationLowEC2"
      comparison_operator       = "LessThanOrEqualToThreshold"
      evaluation_periods        = var.mem_utilization_low_evaluation_periods
      metric_name               = "MemoryUtilization"
      namespace                 = "aws/EC2"
      period                    = var.mem_utilization_low_period_seconds
      statistic                 = var.mem_utilization_low_statistic
      threshold                 = var.mem_utilization_low_threshold_percent
      dimensions_name           = "AutoScalingGroupName"
      dimensions_target         = aws_autoscaling_group.asg.name
      alarm_description         = "Scale down if the Memory utilization is below ${var.mem_utilization_low_threshold_percent} for ${var.mem_utilization_low_period_seconds} seconds"
      alarm_actions             = [aws_autoscaling_policy.scale_down.arn]
      treat_missing_data        = "missing"
      ok_actions                = []
      insufficient_data_actions = []
    } 
  }

  all_alarms = local.ec2_alarms

  common_tags = {
    CreatedBy   = "Kiran Peddineni"
    Environment = "Dev"
    Maintainer  = "Kiran Peddineni"
  }
}
