# ECS Configuration

About:
------
 This Configuration is to create ECS in AWS. it will Launch Autoscaling group and Required Instances and Creates Cloud Waatch Alarams to Monitor your instances CPU and Memory and based on that it will scale up and down your Autoscaling Group.
       
How To Run:
-----------

 Clone The repo and run the terraform module.
 
     git clone https://github.com/kiranpe/Terraform_AWS_ECS.git
     
     To Intialize Terraform:
     terrform init
     
     To Create ECS:
     terraform apply -auto-approve
     
     To Destroy ECS:
     terraform destroy -auto-approve
     
Git Ref:
--------
 You can also use git ref to Launch ECS.
 
     module "ecs" {
       source = "git::https://github.com/kiranpe/Terraform_AWS_ECS.git?ref=v1.0.0"
     }
     
Note:  Before Running ECS Configuration you need to Run VPC Configuration first. This Module have a datasource dependency on that.
----
