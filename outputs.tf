output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

output "discovered_vpc_id" {
  description = "ID of the discovered VPC"
  value       = data.aws_vpc.existing.id
}

output "discovered_subnet_id" {
  description = "ID of the discovered subnet"
  value       = data.aws_subnet.public.id
}

output "discovered_security_group_id" {
  description = "ID of the discovered security group"
  value       = data.aws_security_group.existing.id
}

output "ami_id" {
  description = "ID of the Amazon Linux 2023 AMI used"
  value       = data.aws_ami.amazon_linux_2023.id
}
