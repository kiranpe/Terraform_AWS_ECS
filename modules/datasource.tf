#AMI DataSource Configuration

data "aws_ami" "amazon2" {
  most_recent = true
  owners      = ["591542846629"] # AWS

  filter {
    name   = "name"
    values = ["*amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

#VPC and Security Group DataSource Configuration

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Type"
    values = [var.subnets]
  }
}

data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}
