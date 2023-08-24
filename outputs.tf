# Output the VPC ID
output "vpc_id" {
  value       = aws_vpc.vpc_poc.id
  description = "The ID of the VPC"
}

output "vpc_arn" {
  value       = aws_vpc.vpc_poc.arn
  description = "Amazon Resource Name (ARN) of VPC"
}

output "instance_tenancy" {
  value       = aws_vpc.vpc_poc.instance_tenancy
  description = "Tenancy of instances spin up within VPC"
}

output "enable_network_address_usage_metrics" {
  value       = aws_vpc.vpc_poc.enable_network_address_usage_metrics
  description = "Whether Network Address Usage metrics are enabled for the VPC"
}

output "main_route_table_id" {
  value       = aws_vpc.vpc_poc.main_route_table_id
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association."
}

output "enable_dns_hostnames" {
  value       = aws_vpc.vpc_poc.enable_dns_hostnames
  description = "Tenancy of instances spin up within VPC"
}


output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_arn" {
  value = aws_subnet.private_subnets[*].arn
}

output "public_subnet_arn" {
  value = aws_subnet.public_subnets[*].arn
}

