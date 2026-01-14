# Descobrir VPC existente usando tag Name
data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Descobrir subnet pública existente usando tag Name
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }

  # Garantir que está na VPC correta
  vpc_id = data.aws_vpc.existing.id
}

# Descobrir security group existente usando tag Name
data "aws_security_group" "existing" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }

  vpc_id = data.aws_vpc.existing.id
}

# Buscar AMI mais recente do Amazon Linux 2023
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
