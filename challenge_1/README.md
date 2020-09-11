# Sept-Challange
# maha-3-tier-app - Challenge 1
Simple 3-tier app deployed to AWS using Terraform.

# Requirements
- Terraform >= `0.11.1`
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables exported.

# Description
VPC : with one Public and a private subnets, Internet gateway to talk to public traffic , NAT gateway, Private route table, elastic IP.

userdata.tpl file has 4 services : app1,app2,MongoDB and Nginix which are docker containers and gets installed on EC2 server. 
This is associated and initiated in ec2.tf file

security_group contains Inbound and outbound rules. 

variables.tf contains all necessary variables and data that is required for ec2.tf
it also reuires a public key (sshkeygen tool to create pub file ) , we need to create a key-value pair to allow ssh connection to the ec2 server.
It can be done using aws cli or aws console. You get a pemfile(private key) and save it in the location as specified in var.tf and use sshkeygen tool to create public key , you can also change the path in var.tf to point to pub file.


# Usage
Clone this repository and run:

Initializing Terrraform remote backend:
```
  ~/challenge_1/ terraform init -backend-config=terraform.remote
```
this command will initialize the terraform

Terraform plan:
```
  ~/challenge_1/ terraform plan
```
this command will give the complete plan what you are trying to achieve, like showing how many resources you are creating
so that , we can see before we execute the plan.

Terraform apply:
```
  ~/challenge_1/ terraform apply
```
this command will actually execute our plan and create required resources.


After the process is completed, should then be able to connect to `http://EC2_INSTANCE_IP/app1` and `http://EC2_INSTANCE_IP/app2` in your browser.

# Future addition 

# References
- https://github.com/lbracken/docker-example (for the example 3-tier application)
