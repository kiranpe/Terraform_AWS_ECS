#IAM Policy Variables

variable "role_name" {
  description = "ECS IAM Role Name"
  type        = string
  default     = "ecs-autoscalling-group-role"
}

variable "policy_name" {
  description = "IAM Policy Name"
  type        = string
  default     = "ecs-autoscaling-policy"
}

variable "policy_attach_name" {
  description = "IAM Policy Attachement Name"
  type        = string
  default     = "ecs-attach-policy"
}

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
  default     = "ecs-profile"
}
