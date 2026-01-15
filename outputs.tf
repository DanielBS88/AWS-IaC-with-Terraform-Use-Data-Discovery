output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.cmtr_k5vl9gpq_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.cmtr_k5vl9gpq_instance.public_ip
}
