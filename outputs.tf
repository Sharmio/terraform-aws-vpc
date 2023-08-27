# Output the VPC ID
output "vpc_id" {
  value       = aws_vpc.vpc_poc.id
  description = "The ID of the VPC."
}

output "vpc_arn" {
  value       = aws_vpc.vpc_poc.arn
  description = "Amazon Resource Name (ARN) of the VPC."
}

output "instance_tenancy" {
  value       = aws_vpc.vpc_poc.instance_tenancy
  description = "The tenancy of instances spun up within the VPC."
}

output "enable_network_address_usage_metrics" {
  value       = aws_vpc.vpc_poc.enable_network_address_usage_metrics
  description = "Indicates whether Network Address Usage metrics are enabled for the VPC."
}

output "main_route_table_id" {
  value       = aws_vpc.vpc_poc.main_route_table_id
  description = "The ID of the main route table associated with this VPC. You can change a VPC's main route table using an aws_main_route_table_association."
}

output "enable_dns_hostnames" {
  value       = aws_vpc.vpc_poc.enable_dns_hostnames
  description = "Indicates whether DNS hostnames are enabled for the VPC."
}

output "private_subnet_id" {
  value       = aws_subnet.private_subnets[*].id
  description = "The IDs of the private subnets."
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnets[*].id
  description = "The IDs of the public subnets."
}

output "private_subnet_arn" {
  value       = aws_subnet.private_subnets[*].arn
  description = "Amazon Resource Names (ARNs) of the private subnets."
}

output "public_subnet_arn" {
  value       = aws_subnet.public_subnets[*].arn
  description = "Amazon Resource Names (ARNs) of the public subnets."
}
