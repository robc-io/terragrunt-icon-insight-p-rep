variable "aws_region" {
  description = "AWS region to use for all resources"
}

variable "ops_region" {
  description = "AWS region with ops cluster"
}

variable "aws_allowed_account_ids" {
  description = "List of allowed AWS accounts where this configuration can be applied"
  type        = list
}

provider "aws" {
  version = "~> 2.2"

  alias = "main"

  region              = var.aws_region
//  region = "us-east-1"

  allowed_account_ids = var.aws_allowed_account_ids

  # Make it faster by skipping some things
  skip_get_ec2_platforms     = true
  skip_metadata_api_check    = true
  skip_region_validation     = true
  skip_requesting_account_id = true
}

provider "aws" {
  version = "~> 2.2"

  alias = "ops"

  region              = var.ops_region
//  region = "us-east-1"

  allowed_account_ids = var.aws_allowed_account_ids

  # Make it faster by skipping some things
  skip_get_ec2_platforms     = true
  skip_metadata_api_check    = true
  skip_region_validation     = true
  skip_requesting_account_id = true
}

terraform {
  backend "s3" {}
}