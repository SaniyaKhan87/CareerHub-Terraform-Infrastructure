# CareerHub - Terraform Infrastructure

## Project Overview

CareerHub is a job portal web application. This project demonstrates Infrastructure as Code (IaC) using Terraform, AWS CloudFormation, and AWS CDK.

Terraform was used to provision the main AWS infrastructure and deploy the CareerHub application on an EC2 instance. CloudFormation and AWS CDK were also used to create similar AWS infrastructure.

## Business Scenario

The CareerHub application requires AWS infrastructure that can be created and managed in a repeatable way.

Instead of manually creating all AWS resources, Infrastructure as Code was used to automate the provisioning and management of the infrastructure.

## Project Objectives

- Provision CareerHub infrastructure using Terraform.
- Create reusable Terraform modules.
- Manage Terraform state.
- Configure remote state using Amazon S3.
- Demonstrate infrastructure drift.
- Deploy CareerHub on a Terraform-provisioned EC2 instance.
- Create similar infrastructure using AWS CloudFormation.
- Create similar infrastructure using AWS CDK.
- Compare Terraform, CloudFormation, and AWS CDK.
- Manage the project using Git and GitHub.

## AWS Infrastructure

The CareerHub infrastructure created using Terraform includes:

- VPC
- Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- Elastic IP
- S3 Bucket

AWS Region:

```text
ap-southeast-2

EC2 Instance Type:

c7i-flex.large

Root Volume:

30 GB
Terraform Implementation

Terraform was used to provision the CareerHub AWS infrastructure.

The main Terraform configuration files are:

provider.tf
main.tf
variables.tf
outputs.tf

Terraform was used to create the VPC, subnet, Internet Gateway, route table, Security Group, EC2 instance, Elastic IP, and S3 bucket.

Terraform commands used during the project included:

terraform init
terraform validate
terraform plan
terraform apply
terraform show
terraform state list
terraform state show
Terraform Modules

The Terraform configuration was divided into reusable modules.

modules/
├── vpc/
├── security-group/
├── ec2/
└── s3/
VPC Module

Creates:

VPC
Subnet
Internet Gateway
Route Table
Route Table Association
Security Group Module

Creates the CareerHub Security Group and allows the required ports.

EC2 Module

Creates:

EC2 instance
Elastic IP
Elastic IP association
S3 Module

Creates the CareerHub S3 bucket.

Terraform State Management

Terraform state was inspected and managed using:

terraform show
terraform state list
terraform state show module.vpc.aws_vpc.this
terraform plan

terraform plan was used to verify that the actual AWS infrastructure matched the Terraform configuration.

Remote State Management

Terraform remote state was configured using an Amazon S3 bucket.

Remote state bucket:

careerhub-terraform-state-1790939597

State key:

careerhub/terraform.tfstate

Region:

ap-southeast-2

Encryption was enabled.

The local Terraform state was migrated to the S3 backend using:

terraform init -migrate-state

The remote state was verified using:

aws s3 ls s3://careerhub-terraform-state-1790939597/careerhub/
Infrastructure Drift

Infrastructure drift was demonstrated by manually changing the Security Group Name tag outside Terraform.

Terraform detected the change using:

terraform plan

Terraform showed one change because the actual AWS configuration was different from the Terraform configuration.

The expected configuration was restored using:

terraform apply

A final terraform plan showed:

No changes. Your infrastructure matches the configuration.
CloudFormation Implementation

A CloudFormation template was created for CareerHub:

cloudformation/careerhub-stack.yaml

The template creates:

VPC
Subnet
Internet Gateway
Route Table
Security Group
EC2 Instance
Elastic IP
S3 Bucket

The template was validated using:

aws cloudformation validate-template \
  --template-body file://careerhub-stack.yaml \
  --region ap-southeast-2

The stack was deployed using:

aws cloudformation deploy \
  --stack-name CareerHub-CloudFormation-Stack \
  --template-file careerhub-stack.yaml \
  --region ap-southeast-2

The stack outputs were verified using:

aws cloudformation describe-stacks \
  --stack-name CareerHub-CloudFormation-Stack \
  --region ap-southeast-2 \
  --query 'Stacks[0].Outputs'
AWS CDK Implementation

An AWS CDK project was created using TypeScript.

The CDK project is located in:

cdk/

The CDK infrastructure includes:

VPC
Public Subnet
Internet Gateway
Route Table
Security Group
EC2 Instance
Elastic IP
S3 Bucket

CDK commands used:

npx cdk init app --language typescript
npx tsc --noEmit
npx cdk synth
npx cdk bootstrap aws://182547090503/ap-southeast-2
npx cdk deploy

The CDK deployment was successfully completed.

Terraform, CloudFormation and AWS CDK Comparison
Feature	Terraform	AWS CloudFormation	AWS CDK
Developed by	HashiCorp	AWS	AWS
Configuration	HCL	YAML	TypeScript
Cloud Support	Multi-cloud	AWS	AWS
State / Management	Terraform state	CloudFormation stack	CloudFormation stack
Reusability	Terraform modules	CloudFormation templates	CDK constructs
Deployment	terraform apply	CloudFormation stack	cdk deploy
Commands Used
Terraform
terraform init
terraform validate
terraform plan
terraform apply
terraform show
terraform state list
terraform state show
terraform init -migrate-state
AWS CLI
aws sts get-caller-identity
aws s3 ls
aws ec2 create-tags
aws cloudformation validate-template
aws cloudformation deploy
aws cloudformation describe-stacks
AWS CDK
npx cdk init app --language typescript
npx tsc --noEmit
npx cdk synth
npx cdk bootstrap
npx cdk deploy
Folder Structure
CareerHub-Terraform-Infrastructure/
├── README.md
├── .gitignore
├── .terraform.lock.hcl
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── vpc/
│   ├── security-group/
│   ├── ec2/
│   └── s3/
│
├── cloudformation/
│   └── careerhub-stack.yaml
│
├── cdk/
│   ├── bin/
│   ├── lib/
│   ├── test/
│   ├── cdk.json
│   ├── package.json
│   └── tsconfig.json
│
├── screenshots/
│
└── documentation/
Challenges Faced
Understanding and creating Terraform modules.
Migrating Terraform state to Amazon S3 remote state.
Demonstrating infrastructure drift.
Deploying the CareerHub application on the Terraform-provisioned EC2 instance.
Creating the same type of infrastructure using CloudFormation and AWS CDK.
Fixing the Elastic IP association issue during the CDK deployment.
Learning Outcomes

Through this project, I learned:

Infrastructure as Code using Terraform.
Terraform variables and outputs.
Terraform modules.
Terraform state management.
Remote state using Amazon S3.
Infrastructure drift detection.
AWS CloudFormation.
AWS CDK using TypeScript.
Git and GitHub version control.
Deploying and verifying infrastructure on AWS.
