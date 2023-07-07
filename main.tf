locals {
  config = yamldecode(file("${path.module}/config.yaml"))
  tags = {
    Environment = local.config.env_name
    Owner       = local.config.owner
    Purpose     = local.config.purpose
  }
}

provider "aws" {
  profile     = local.config.aws_profile
  region      = local.config.aws_region
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.4.0"

  bucket                   = local.config.env_name
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"
  tags                     = local.tags
  versioning = {
    enabled = true
  }
}
