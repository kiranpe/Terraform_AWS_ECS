#VPC Configuration

variable "vpc_name" {
  description = "Launch ECS in VPC"
  type        = string
  default     = "ecs-vpc"
}

variable "subnet_select" {
  description = "Subnet yto Launch EC2"
  type        = string
  default     = "public-subnet-0"
}
