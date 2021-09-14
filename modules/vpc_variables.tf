#VPC Configuration

variable "vpc_name" {
  description = "Launch ECS in VPC"
  type        = string
  default     = "ecs-vpc"
}

variable "subnets" {
  description = "Subnet to Launch EC2"
  type        = string
  default     = "Public"
}
