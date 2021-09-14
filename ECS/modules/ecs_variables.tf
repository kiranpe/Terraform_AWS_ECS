#Launch Configuration

variable "instance_group" {
  default     = "default"
  description = "The name of the instances that you consider as a group"
}

variable "region" {
  description = "Launch ECS in region"
  type        = string
  default     = "us-east-2"
}

variable "create_lc" {
  description = "Whether to create launch configuration"
  type        = bool
  default     = true
}

variable "create_asg" {
  description = "Whether to create autoscaling group"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
  default     = "ecs-cluster"
}

variable "lc_name" {
  description = "Creates a unique name for launch configuration beginning with the specified prefix"
  type        = string
  default     = "ecs_lc_group"
}

variable "instance_type" {
  description = "The size of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key File to use SSH to the servers"
  type        = string
  default     = "ecs"
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type        = string
  default     = "arn:aws:iam::811816443625:instance-profile/WSOEC2RoleInstanceProfile"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = list(string)
  default     = ["ecs-sec-group"]
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable "ecs_config" {
  default     = "echo '' > /etc/ecs/ecs.config"
  description = "Specify ecs configuration or get it from S3. Example: aws s3 cp s3://some-bucket/ecs.config /etc/ecs/ecs.config"
}

variable "custom_userdata" {
  default     = ""
  description = "Inject extra command in the instance template to be run on boot"
}

variable "ecs_logging" {
  default     = "[\"json-file\",\"awslogs\"]"
  description = "Adding logging option to ECS that the Docker containers can use. It is possible to add fluentd as well"
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
  default     = null
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring. This is enabled by default."
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance"
  type        = list(map(string))
  default = [{
  volume_size = 8 }]
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default = [{
    volume_size           = 8
    volume_type           = "gp2"
    device_name           = "/dev/xvdh"
    delete_on_termination = false
  }]
}

variable "spot_price" {
  description = "The price to use for reserving spot instances"
  type        = string
  default     = ""
}

variable "efs_mountpoint" {
  default = ""
  type    = string
}

variable "asg_grp" {
  default = "ecs-autoscaling-group"
  type    = string
}

variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "dev"
}

variable "cloudwatch_prefix" {
  default     = ""
  description = "If you want to avoid cloudwatch collision or you don't want to merge all logs to one log group specify a prefix"
}

variable "max_size" {
  default     = 2
  description = "Maximum size of the nodes in the cluster"
}

variable "min_size" {
  default     = 1
  description = "Minimum size of the nodes in the cluster"
}

variable "desired_capacity" {
  default     = 2
  description = "The desired capacity of the cluster"
}

variable "load_balancers" {
  type        = list(any)
  default     = []
  description = "The load balancers to couple to the instances. Only used when NOT using ALB"
}

#CloudWatch

variable "cloudwatch_alarm_name" {
  description = "Generic name used for CPU and Memory Cloudwatch Alarms"
  default     = ""
  type        = string
}

