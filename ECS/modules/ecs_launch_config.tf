# Launch configuration

resource "aws_launch_configuration" "this" {
  name                        = var.lc_name
  image_id                    = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ecs_profile.arn
  key_name                    = var.key_name
  security_groups             = [data.aws_security_group.selected.id]
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = data.template_file.user_data.rendered
  user_data_base64            = var.user_data_base64
  enable_monitoring           = var.enable_monitoring
  spot_price                  = var.spot_price
  ebs_optimized               = var.ebs_optimized

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      no_device             = lookup(ebs_block_device.value, "no_device", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

#User Data

data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.sh")

  vars = {
    ecs_config        = var.ecs_config
    ecs_logging       = var.ecs_logging
    cluster_name      = var.cluster_name
    env_name          = var.environment
    custom_userdata   = var.custom_userdata
    cloudwatch_prefix = var.cloudwatch_prefix
  }
}

# Autoscaling group

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.environment}_${var.cluster_name}_${var.instance_group}"
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  force_delete         = true
  launch_configuration = aws_launch_configuration.this.id
  vpc_zone_identifier  = [data.aws_subnet.filtered_subnet.id]
  load_balancers       = var.load_balancers

  lifecycle {
    create_before_destroy = true
  }
}
