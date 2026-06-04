# Terraform AWS Infrastructure

This repository contains Terraform configurations for provisioning AWS EC2 infrastructure. It includes a basic EC2 example and a separate configuration for launching EC2 instances with different operating system options.

## Project Structure

```text
TerraForm/
├── .gitignore
├── README.md
├── ec2/
│   └── maint.tf
└── ec2_with_different_os/
    ├── main.tf
    ├── variables.tf
    └── terrafrom.tf
```

## What This Project Does

- Provisions AWS EC2 infrastructure with Terraform.
- Demonstrates a basic EC2 deployment.
- Provides a separate EC2 configuration that can be customized for different operating systems.
- Uses Terraform variables to make infrastructure values easier to change.

## Prerequisites

Before using this project, install and configure the following:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- An active AWS account
- AWS credentials configured locally

Verify your tools:

```bash
terraform version
aws --version
aws sts get-caller-identity
```

## AWS Authentication

Terraform needs AWS credentials to create resources. The recommended local setup is to configure the AWS CLI:

```bash
aws configure
```

You will be prompted for:

- AWS access key ID
- AWS secret access key
- Default AWS region
- Default output format

Do not commit AWS credentials, private keys, `.tfstate` files, or secret values to GitHub.

## How to Use

Terraform commands should be run from the directory that contains the configuration you want to deploy.

### Basic EC2 Configuration

```bash
cd ec2
terraform init
terraform validate
terraform plan
terraform apply
```

When prompted, type:

```text
yes
```

### EC2 With Different OS Configuration

```bash
cd ec2_with_different_os
terraform init
terraform validate
terraform plan
terraform apply
```

If the configuration uses variables, review `variables.tf` and provide values using one of these methods:

### Option 1: Interactive Input

Terraform will prompt you for any required variables that do not have default values.

### Option 2: `terraform.tfvars`

Create a `terraform.tfvars` file in the same folder as the Terraform configuration:

```hcl
# Example only. Match these names to the variables declared in variables.tf.
region        = "us-east-1"
instance_type = "t2.micro"
```

Then run:

```bash
terraform plan
terraform apply
```

### Option 3: Command-Line Variables

```bash
terraform plan -var="instance_type=t2.micro"
terraform apply -var="instance_type=t2.micro"
```

## Common Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Format Terraform files:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Apply changes:

```bash
terraform apply
```

Show current state:

```bash
terraform show
```

List resources in state:

```bash
terraform state list
```

Destroy resources:

```bash
terraform destroy
```

## Destroying Infrastructure

To avoid unexpected AWS charges, destroy resources when you no longer need them:

```bash
terraform destroy
```

When prompted, type:

```text
yes
```

## GitHub Safety Notes

Before pushing this repository to GitHub, make sure the following files are ignored and not committed:

- `.terraform/`
- `terraform.tfstate`
- `terraform.tfstate.backup`
- `*.tfvars`
- `*.tfvars.json`
- `crash.log`
- `*.pem`
- `*.key`

If any sensitive files were already committed, remove them from Git history and rotate the exposed credentials or keys.

## Recommended Workflow

1. Choose the Terraform configuration directory.
2. Run `terraform init`.
3. Run `terraform fmt`.
4. Run `terraform validate`.
5. Run `terraform plan`.
6. Review the planned AWS resources carefully.
7. Run `terraform apply`.
8. Destroy resources with `terraform destroy` when finished.

## Notes

- Terraform loads every `.tf` file in the current directory.
- Run Terraform commands inside the specific configuration folder you want to deploy.
- AWS resources may create costs even when used for testing.
- Keep secrets out of source control.

## License

Add a license file if you plan to make this repository public.