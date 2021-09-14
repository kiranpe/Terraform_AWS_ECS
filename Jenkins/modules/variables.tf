#Variables Configuration

variable "ec2_type" {
  description = "EC2 disk type"
  type        = string
  default     = "t2.medium"
}

variable "key" {
  description = "key pair name to connect to EC2"
  type        = string
  default     = "jenkins"
}

variable "security_group" {
  description = "Security Group name to configure in EC2"
  type        = string
  default     = "DevOps"
}

variable "user_name" {
  description = "Username to connect to EC2"
  type        = string
  default     = "ubuntu"
}

variable "ports" {
  description = "List of Ports that are configure in Security Group"
  type        = list(number)
  default     = [22, 80, 443, 8080]
}

variable "cidr" {
  description = "CIDR block range"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "protocol_type" {
  description = "Type of Protocol use in Security Group"
  type        = string
  default     = "tcp"
}
