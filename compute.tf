locals {
  instance_name = "${var.project_id}-instance"
}

resource "aws_instance" "cmtr-k5vl9gpq-instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name          = local.instance_name
    ProjectID     = var.project_id
    SecurityGroup = var.security_group_name
  }
}
