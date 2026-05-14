terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "roboshop13-remote-state"
    key    = "roboshop-cicd-tools"
    region = "us-east-1"
    #dynamodb_table = "roboshop13-locking"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}