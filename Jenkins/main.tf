module "jenkins" {
  source = "./modules"
}

output "jenkins_instance_ip" {
  value = module.jenkins.instance_ip
}

output "jenkins_url" {
  value = module.jenkins.jenkins_url
}

output "jenkins_sec_grp_id" {
  value = module.jenkins.sec_grp_id
}
