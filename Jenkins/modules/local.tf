#Local Tags and Values Configuration

locals {
  public_ip  = aws_instance.jenkins.public_ip
  public_dns = aws_instance.jenkins.public_dns
  sec_grp_id = aws_security_group.mysec.id

  common_tags = {
    Name        = "Jenkins-Instance"
    CreatedBy   = "Kiran Peddineni"
    Env         = "Non-Prod"
    Maintainers = "DevOps Team"
  }

  security_group_tags = {
    Name        = "Jenkins-Sec-Group"
    CreatedBy   = "Kiran Peddineni"
    Env         = "Non-Prod"
    Maintainers = "DevOps Team"
  }
}
