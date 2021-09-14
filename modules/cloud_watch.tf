#CloudWatch
############

resource "aws_cloudwatch_metric_alarm" "alarm_mem" {
  alarm_name        = "MemoryUtilizationAlarmHighEC2"
  alarm_description = "MemoryUtilization > 80% for 5 minutes"
  alarm_actions     = [aws_autoscaling_policy.ecsservermemscaleuppolicy.arn]

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "MemoryUtilization"
  namespace           = "aws/ECS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_cpu" {
  alarm_name        = "CPUUtilizationAlarmHighEC2"
  alarm_description = "CPUUtilization > 80% for 3 minutes"
  alarm_actions     = [aws_autoscaling_policy.ecsservercpuscaleuppolicy.arn]

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "aws/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_mem_low" {
  alarm_name        = "MemoryUtilizationLowEC2"
  alarm_description = "MemoryUtilization < 30% for 5 minutes"
  alarm_actions     = [aws_autoscaling_policy.ecsservermemscaledownpolicy.arn]

  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "MemoryUtilization"
  namespace           = "aws/ECS"
  period              = "30"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_cpu_low" {
  alarm_name        = "CPUUtilizationLowEC2"
  alarm_description = "Monitors ECS CPU Utilization"
  alarm_actions     = [aws_autoscaling_policy.ecsservercpuscaledownpolicy.arn]

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "MemoryUtilization"
  namespace           = "aws/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}

resource "aws_autoscaling_policy" "ecsservermemscaleuppolicy" {
  name                   = "ECSServerMemScaleUpPolicy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "ecsservercpuscaleuppolicy" {
  name                   = "ECSServerCPUScaleUpPolicy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "ecsservermemscaledownpolicy" {
  name                   = "ECSServerMemScaleDownPolicy"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "ecsservercpuscaledownpolicy" {
  name                   = "ECSServerCPUScaleDownPolicy"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
