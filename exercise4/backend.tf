terraform {
  backend "s3" {
    bucket = "fhats3buck"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}