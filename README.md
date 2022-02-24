# Terraform VPC
Configuration in this directory maps out aws VPC resources for a simple development environment.

Includes github actions for Testing.

## Usage


### on pull

```bash
$ terraform plan
```

### on merge to main

```bash
terraform apply -destroy --auto-approve
```

## Providers

No providers.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.2.0 |


## Git Secrets
(required to run git actions)

| Name |
|------|
| <a name="requirement"></a> [AWS_SECRET_KEY](#requirement\_Secrets) | >= 1.0 |
| <a name="requirement"></a> [AWS_REGION](#requirement\Secrets) | >= 1.0 |
| <a name="requirement"></a> [AWS_ACESSKEY](#requirement\Secrets) | >= 1.0 |
