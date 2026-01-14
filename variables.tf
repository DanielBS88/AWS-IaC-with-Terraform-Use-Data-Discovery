variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "project_id" {
  description = "Project identifier used for tagging and naming resources"
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC to discover via data source"
  type        = string
}

variable "public_subnet_name" {
  description = "Name tag of the public subnet to discover via data source"
  type        = string
}

variable "security_group_name" {
  description = "Name tag of the security group to discover via data source"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
