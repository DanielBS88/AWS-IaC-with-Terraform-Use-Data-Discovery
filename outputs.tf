output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.cmtr_k5vl9gpq_instance.id
}

output "cmtr-k5vl9gpq-instance" {
  description = "EC2 instance ID for lab validator"
  value       = aws_instance.cmtr_k5vl9gpq_instance.id
}

