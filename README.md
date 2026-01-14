Me ajude a resolver o problema abaixo, passo a passo. Estou linux e preciso gerar os files em terraform para revolver o problema abaixo. Logo me de os passos de como conectar no meu git respositorio e comitar. Também me explique o código, porque tenho que declarar, criar tal arquivo, para que eu possa aprender corretamente terraform e AWS.

Me gere os arquivos de maneira rapida e eficaz no linux, por exemplo. Usando comandos avançados como Touch ou cat >>, dessa forma eu consigo economizar tempo.

Também me mostre como gerar o arquvio .ignore, para evitar envio de arquivos pesado para o repositorio. Me explique por que isso é uma boa pratica.

AWS IaC with Terraform: Use Data Discovery

Lab Description
The objective of this lab is to learn about Terraform data sources and querying existing AWS infrastructure using a data-driven approach. This approach is more flexible and removes dependency between states. Instead of using remote state references, you will discover existing AWS resources using data sources with filters and tags.
Common Task Requirements
•	Do not define the backend in the configuration; Terraform will use the local backend by default.
•	Avoid the usage of the local-exec provisioner.
•	The use of the prevent_destroy lifecycle attribute is prohibited.
•	Use versions.tf to define the required versions of Terraform and its providers.
•	Define the Terraform required_version as >= 1.5.7.
•	All variables must include valid descriptions and type definitions, and they should only be defined in variables.tf.
•	Resource names provided in tasks should be defined via variables or generated dynamically/concatenated (e.g., in locals using Terraform functions). Avoid hardcoding in resource definitions or using the default property for variables.
•	Configure all non-sensitive input parameter values in terraform.tfvars.
•	Outputs must include valid descriptions and should only be defined in outputs.tf.
•	Ensure TF configuration is clean and correctly formatted. Use the terraform fmt command to rewrite Terraform configuration files into canonical format and style.


Task Resources
•	AWS data sources: aws_vpc, aws_subnet, aws_security_group, aws_ami
•	AWS aws_instance resource - allows provisioning and managing EC2 instances in AWS
•	Local files:
o	variables.tf - defines variables used across Terraform configurations
o	terraform.tfvars - contains variable values provided by the platform
o	data.tf - contains data source configurations for resource discovery
o	compute.tf - defines the EC2 instance using data source outputs
•	Pre-deployed Landing Zone infrastructure:
o	VPC cmtr-k5vl9gpq-vpc with public and private subnets
o	Public subnet cmtr-k5vl9gpq-public-subnet-1 for EC2 instancess
o	Security group cmtr-k5vl9gpq-sg for EC2 instances
o	All resources discoverable via data sources using name tags
•	AWS Region: us-east-1
•	Project ID: cmtr-k5vl9gpq

Objectives
1.	Create files variables.tf, terraform.tfvars, data.tf, and compute.tf.
2.	In the variables.tf file, define the following variables with appropriate descriptions and types:
o	aws_region - AWS region for resources
o	project_id - Project identifier for tagging
o	vpc_name - Name of the VPC to discover
o	public_subnet_name - Name of the public subnet to discover
o	security_group_name - Name of the security group to discover
3.	In the terraform.tfvars file, set the variable values using the platform-provided variables.
4.	In the data.tf file:
o	Configure AWS data sources for resource discovery:
	aws_vpc - discover VPC by name tag
	aws_subnet - discover public subnet by name tag
	aws_security_group - discover security group by name tag
	aws_ami - get latest Amazon Linux 2023 AMI
o	Use filters and tags to find existing resources
5.	In the compute.tf file:
o	Create an aws_instance resource named cmtr-k5vl9gpq-instance
o	Use data source outputs for AMI, subnet, and security group configuration
o	Do NOT hardcode any AWS resource IDs (vpc-xxx, subnet-xxx, sg-xxx)
o	All infrastructure references must come from data sources

Validation and Deployment
1.	Run terraform fmt to format your code
2.	Run terraform validate to ensure configurations are correct
3.	Run terraform plan to preview infrastructure changes
4.	Run terraform apply to deploy the EC2 instance

Task Verification
The verification process will test the following:
1.	File Structure: All required files exist (variables.tf, terraform.tfvars, data.tf, compute.tf)
2.	Data Sources Usage: Configuration uses AWS data sources for resource discovery
3.	Required Data Sources: All required AWS data sources are present and correctly configured
4.	EC2 Instance Creation: EC2 instance is deployed using data source outputs
5.	No Hardcoded Values: No AWS resource IDs are hardcoded in the configuration
Important Notes:
- Do not hardcode any AWS resource IDs in your Terraform configuration
- All infrastructure references must come from data sources, not hardcoded values
- This approach removes dependencies between Terraform states
