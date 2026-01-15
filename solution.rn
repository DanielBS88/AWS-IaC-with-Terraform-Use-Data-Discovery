Criar todos de uma vez:
touch versions.tf variables.tf terraform.tfvars data.tf compute.tf outputs.tf .gitignore

🚀 FASE 3 — versions.tf (VERSÕES OBRIGATÓRIAS)

👉 Por que existe?
Garante:

Versão mínima do Terraform

Versão compatível do provider AWS
Evita bugs em ambientes diferentes.

cat <<EOF > versions.tf
terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
EOF

🚀 FASE 4 — variables.tf (SOMENTE DECLARAÇÃO)

👉 Regra do lab:

Variáveis somente aqui, com type e description

cat <<EOF > variables.tf
variable "aws_region" {
  description = "AWS region where resources are located"
  type        = string
}

variable "project_id" {
  description = "Project identifier used for naming and tagging"
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC to discover"
  type        = string
}

variable "public_subnet_name" {
  description = "Name tag of the public subnet to discover"
  type        = string
}

variable "security_group_name" {
  description = "Name tag of the security group to discover"
  type        = string
}
EOF


📌 Por que isso é boa prática?

Código reutilizável

Separação de lógica x configuração

Facilita CI/CD

🚀 FASE 5 — terraform.tfvars (VALORES)

👉 Aqui ficam os valores reais, não no código.

cat <<EOF > terraform.tfvars
aws_region          = "us-east-1"
project_id          = "cmtr-k5vl9gpq"
vpc_name            = "cmtr-k5vl9gpq-vpc"
public_subnet_name  = "cmtr-k5vl9gpq-public-subnet-1"
security_group_name = "cmtr-k5vl9gpq-sg"
EOF


📌 Por que isso é essencial?

Permite múltiplos ambientes (dev, qa, prod)

Evita hardcode

Facilita automação

🚀 FASE 6 — data.tf (DATA DISCOVERY 🔎)

👉 O coração do lab

cat <<EOF > data.tf
provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
EOF

🧠 O QUE ESTÁ ACONTECENDO AQUI?

data.aws_vpc → descobre VPC existente

data.aws_subnet → descobre subnet pública

data.aws_security_group → descobre SG

data.aws_ami → busca AMI mais recente

💡 Zero dependência de outro state Terraform

🚀 FASE 7 — compute.tf (EC2 USANDO DATA SOURCES)
cat <<EOF > compute.tf
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name    = "\${var.project_id}-instance"
    Project = var.project_id
  }
}
EOF


📌 Por que isso passa no lab?

Nenhum ID hardcoded

Tudo vem de data.*

Nome gerado dinamicamente

🚀 FASE 8 — outputs.tf
cat <<EOF > outputs.tf
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
EOF

🚀 FASE 9 — .gitignore (BOA PRÁTICA 🔥)
cat <<EOF > .gitignore
.terraform/
*.tfstate
*.tfstate.backup
*.log
.crash.log
terraform.tfvars
EOF

❓ Por que isso é essencial?

.terraform/ → binários grandes

.tfstate → contém dados sensíveis

terraform.tfvars → pode ter segredos

Repositório fica limpo e seguro

🚀 FASE 10 — FORMATAR, VALIDAR E DEPLOY
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

🚀 FASE 11 — COMMIT NO GIT
git status
git add .
git commit -m "Terraform lab: data discovery with AWS resources"


Se quiser conectar a um repositório remoto:

git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git
git branch -M main
git push -u origin main
