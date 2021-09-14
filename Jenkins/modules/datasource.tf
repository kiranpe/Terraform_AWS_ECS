#EC2 DataSource Configuration

data "aws_ami" "ec2" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210129"]
  }
}
