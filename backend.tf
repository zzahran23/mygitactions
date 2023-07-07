terraform {
  backend "s3" {
    bucket         = "terraform-state-backend-155531623723-us-east-1"
    dynamodb_table = "terraform-state-backend-lock-155531623723-us-east-1"
    encrypt        = "true"
    key            = "mygitactions/terraform.tfstate"
    region         = "us-east-1"
    profile        = "dev"
  }
}
