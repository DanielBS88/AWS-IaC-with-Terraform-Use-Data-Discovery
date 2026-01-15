resource "aws_instance" "cmtr_k5vl9gpq_instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name    = "cmtr-k5vl9gpq-instance"
    Project = var.project_id
  }
}

