# Terraform AWS VPC Setup
This Terraform module creates an AWS Virtual Private Cloud (VPC) with associated subnets, network ACLs, route tables, and an internet gateway. It's designed to set up a basic network environment for your application.

## Usage

```hcl
module "vpc" {

  # VPC Resources
  source                               = "git@github.com:Sharmio/terraform-aws-vpc.git"
  cidr_block                           = "10.0.0.0/16"
  instance_tenancy                     = "default"
  enable_network_address_usage_metrics = false

  # dns resources
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Subnet Resources
  availability_zones                          = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  enable_resource_name_dns_a_record_on_launch = false
  public_subnet_cidrs                         = ["10.0.3.0/24"]
  private_subnet_cidrs                        = ["10.0.1.0/24", "10.0.2.0/24"]

  # Route Table Resources


  # tags resources
  common_resource_tags = local.resource_tags
  terraform_version    = var.terraform_version
  aws_provider_version = var.aws_provider_version
  branch               = var.branch
}
```

