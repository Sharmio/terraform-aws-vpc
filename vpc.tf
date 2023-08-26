resource "aws_vpc" "vpc_poc" {

  cidr_block                           = var.cidr_block
  instance_tenancy                     = var.instance_tenancy
  enable_dns_support                   = var.enable_dns_support
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  tags                                 = merge (var.common_resource_tags, 
    {
    Name = "vpc_${var.project}"
    } 
  )
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.vpc_poc.default_network_acl_id
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = var.common_resource_tags
}


resource "aws_subnet" "private_subnets" {
  count                                       = length(var.private_subnet_cidrs)
  vpc_id                                      = aws_vpc.vpc_poc.id
  availability_zone                           = element(var.availability_zones, count.index)
  cidr_block                                  = element(var.private_subnet_cidrs, count.index)
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch

  tags = merge(var.common_resource_tags,
    {
      Name = "private_subnet_${count.index + 1}_${element(var.availability_zones, count.index)}_${element(var.private_subnet_cidrs, count.index)}"
    }
  )
}


resource "aws_subnet" "public_subnets" {
  count                                       = length(var.public_subnet_cidrs)
  vpc_id                                      = aws_vpc.vpc_poc.id
  cidr_block                                  = element(var.public_subnet_cidrs, count.index)
  availability_zone                           = element(var.availability_zones, count.index + 2)
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch

  tags = merge(var.common_resource_tags,
    {
      Name = "public_subnet_${count.index + 1}_${element(var.availability_zones, count.index + 2)}_${element(var.public_subnet_cidrs, count.index)}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_poc.id

  tags = merge(var.common_resource_tags,
    {
      Name = "igw_${var.project}"
    }
  )
  timeouts {
    create = "20m"
    delete = "20h"
  }
}

resource "aws_default_route_table" "default_rt" {
  default_route_table_id = aws_vpc.vpc_poc.default_route_table_id

  tags = merge(var.common_resource_tags,
    {
      Name = "main_private_rt"
    }
  )
}
 
resource "aws_route_table" "custom_rt" {
  vpc_id = aws_vpc.vpc_poc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.common_resource_tags,
    {
      Name = "custom_public-rt"
    }
  )
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.custom_rt.id
}
