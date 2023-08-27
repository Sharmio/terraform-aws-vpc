
variable "instance_tenancy" {
  type        = string
  description = "What type of instance tenancy"
  default     = "default"
}

variable "cidr_block" {
  type        = string
  description = "Enter the cidr block"
  default     = "10.0.0.0/20"
}

variable "project" {
  type        = string
  description = "Your project name or identifier"
}

variable "company" {
  type        = string
  description = "Your company name or identifier"
}

variable "branch" {
  type        = string
  description = "(optional) describe your variable"
}

variable "terraform_version" {
  type        = string
  description = "(optional) describe your variable"
}

variable "aws_provider_version" {
  type        = string
  description = "optional"
}

variable "enable_dns_hostnames" {
  type        = string
  description = "enable host name for dns"
  default     = true
}

variable "enable_dns_support" {
  type        = string
  description = "enable dns support"
  default     = true
}

variable "common_resource_tags" {
  description = "Common tags from providers.tf"
  type        = map(string)
  default     = {}
}

variable "enable_network_address_usage_metrics" {
  description = "(Optional) Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false."
  type        = string
  default     = false
}

variable "availability_zones" {
  type        = list(string)
  description = "Enter the Availabilit Zones"
  default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type        = string
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS A records"
  default     = false
}