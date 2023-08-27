variable "instance_tenancy" {
  type        = string
  description = "The type of instance tenancy for the VPC (default or dedicated)."
  default     = "default"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/20"
}

variable "project" {
  type        = string
  description = "The name or identifier of your project."
}

variable "company" {
  type        = string
  description = "The name or identifier of your company."
}

variable "branch" {
  type        = string
  description = "The branch or environment to deploy the infrastructure to."
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to be used."
}

variable "aws_provider_version" {
  type        = string
  description = "The version of the AWS provider to be used."
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames for the VPC."
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support for the VPC."
  default     = true
}

variable "common_resource_tags" {
  description = "Common tags to be applied to resources."
  type        = map(string)
  default     = {}
}

variable "enable_network_address_usage_metrics" {
  description = "Indicates whether Network Address Usage metrics are enabled for the VPC."
  type        = bool
  default     = false
}

variable "availability_zones" {
  type        = list(string)
  description = "The list of Availability Zones for subnet creation."
  default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets."
  default     = ["10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets."
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records."
  default     = false
}
