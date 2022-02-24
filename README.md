# Terraform VPC
Configuration in this directory creates VPC resources which may be sufficient for development environment.

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


##
