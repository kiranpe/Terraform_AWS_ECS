#ECS IAM Role and Policy Configuration

resource "aws_iam_role" "ecs_autoscalling_group_role" {
  name               = var.role_name
  assume_role_policy = file("${path.module}/templates/assumerolepolicy.json")
}

resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "A ECS autoscalling group policy"
  policy      = file("${path.module}/templates/iam_autoscalling_policy.json")
}

resource "aws_iam_policy_attachment" "attach" {
  name       = var.policy_attach_name
  roles      = [aws_iam_role.ecs_autoscalling_group_role.name]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "ecs_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ecs_autoscalling_group_role.name
}
