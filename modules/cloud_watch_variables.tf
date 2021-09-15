#CloudWatch Alarms Variables

variable "scale_up_policy_name" {
  type        = string
  default     = "ScaleUpPolicy"
  description = "Name of the Scale Up Policy"
}

variable "scale_up_cooldown_seconds" {
  type        = number
  default     = 120
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
}

variable "scale_up_scaling_adjustment" {
  type        = number
  default     = 1
  description = "The number of instances by which to scale. `scale_up_adjustment_type` determines the interpretation of this number (e.g. as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity"
}

variable "scale_up_adjustment_type" {
  type        = string
  default     = "ChangeInCapacity"
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are `ChangeInCapacity`, `ExactCapacity` and `PercentChangeInCapacity`"
}

variable "scale_up_policy_type" {
  type        = string
  default     = "SimpleScaling"
  description = "The scaling policy type. Currently only `SimpleScaling` is supported"
}

variable "scale_down_policy_name" {
  type        = string
  default     = "ScaleDownPolicy"
  description = "Name of the Scale Down Policy"
}

variable "scale_down_cooldown_seconds" {
  type        = number
  default     = 120
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
}

variable "scale_down_scaling_adjustment" {
  type        = number
  default     = -1
  description = "The number of instances by which to scale. `scale_down_scaling_adjustment` determines the interpretation of this number (e.g. as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity"
}

variable "scale_down_adjustment_type" {
  type        = string
  default     = "ChangeInCapacity"
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are `ChangeInCapacity`, `ExactCapacity` and `PercentChangeInCapacity`"
}

variable "scale_down_policy_type" {
  type        = string
  default     = "SimpleScaling"
  description = "The scaling policy type. Currently only `SimpleScaling` is supported"
}

variable "cpu_utilization_high_evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "cpu_utilization_high_period_seconds" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied"
}

variable "cpu_utilization_high_threshold_percent" {
  type        = number
  default     = 90
  description = "The value against which the specified statistic is compared"
}

variable "cpu_utilization_high_statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: `SampleCount`, `Average`, `Sum`, `Minimum`, `Maximum`"
}

variable "cpu_utilization_low_evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "cpu_utilization_low_period_seconds" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied"
}

variable "cpu_utilization_low_threshold_percent" {
  type        = number
  default     = 5
  description = "The value against which the specified statistic is compared"
}

variable "cpu_utilization_low_statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: `SampleCount`, `Average`, `Sum`, `Minimum`, `Maximum`"
}

variable "mem_utilization_high_evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "mem_utilization_high_period_seconds" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied"
}

variable "mem_utilization_high_threshold_percent" {
  type        = number
  default     = 90
  description = "The value against which the specified statistic is compared"
}

variable "mem_utilization_high_statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: `SampleCount`, `Average`, `Sum`, `Minimum`, `Maximum`"
}

variable "mem_utilization_low_evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "mem_utilization_low_period_seconds" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied"
}

variable "mem_utilization_low_threshold_percent" {
  type        = number
  default     = 5
  description = "The value against which the specified statistic is compared"
}

variable "mem_utilization_low_statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: `SampleCount`, `Average`, `Sum`, `Minimum`, `Maximum`"
}
