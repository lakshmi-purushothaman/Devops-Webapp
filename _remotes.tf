data "terraform_remote_state" "global_networking" {
  backend = "s3"
  config = {
    bucket = "tf-hybrid-kong-bucket"
    key    = "networking.tf"
    region = "eu-west-2"
  }
}