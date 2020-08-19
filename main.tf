#set provider and region
provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
}
#define terraform backend (S3) and bucket name & region
 terraform {
   backend "s3" {
     bucket = "example-terraform-project-name-bootstrap-terraform-state"
     key    = "default-infrastructure"
     region = "eu-central-1"
   }
 }
#define the resource within the bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = "example-terraform-project-name-bootstrap-terraform-state"
#ensure versioning is enabled for robustness and RPO
  versioning {
    enabled = true
  }
}
