#Jenckins EC2 Resource Configuration

resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.ec2.id
  instance_type   = var.ec2_type
  key_name        = var.key
  security_groups = [aws_security_group.mysec.name]

  connection {
    user        = var.user_name
    private_key = tls_private_key.private_key.private_key_pem
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = ["sudo apt-get update"]
  }

  provisioner "local-exec" {
    command = <<EOT
       sleep 10;
        > inventory;
          echo [jenkins] | tee -a inventory;
          echo "${self.public_ip} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" | tee -a inventory;
          ansible-playbook -u ${var.user_name} --private-key jenkins.pem -i inventory ymlfile/configure-jenkins.yml
     EOT
  }

  tags = local.common_tags

  depends_on = [aws_key_pair.key_file, aws_security_group.mysec]
}
