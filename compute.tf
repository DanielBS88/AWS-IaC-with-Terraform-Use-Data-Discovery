# Local values para nome dinâmico da instância
locals {
  instance_name = "${var.project_id}-instance"
}

# Criar instância EC2 usando data sources
resource "aws_instance" "cmtr-k5vl9gpq-instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name      = local.instance_name
    ProjectID = var.project_id
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  monitoring = false

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = true

    tags = {
      Name      = "${local.instance_name}-root"
      ProjectID = var.project_id
    }
  }
}
