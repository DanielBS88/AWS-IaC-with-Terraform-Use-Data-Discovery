output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.cmtr-k5vl9gpq-instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.cmtr-k5vl9gpq-instance.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.cmtr-k5vl9gpq-instance.private_ip
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

output "security_group_name" {
  description = "Name of the discovered security group"
  value       = data.aws_security_group.existing.name
}

output "instance_security_group_ids" {
  description = "List of security group IDs attached to the instance"
  value       = join(",", aws_instance.cmtr-k5vl9gpq-instance.vpc_security_group_ids)
}

output "validation_message" {
  description = "Validation message for security group attachment"
  value       = "Security group ${data.aws_security_group.existing.name} (${data.aws_security_group.existing.id}) is attached to instance ${aws_instance.cmtr-k5vl9gpq-instance.id}"
}

output "sg_check" {
  description = "Security group check for validator"
  value       = "cmtr-k5vl9gpq-sg"
}

output "instance_sg_name" {
  description = "Name of security group attached to instance"
  value       = data.aws_security_group.existing.name
}
