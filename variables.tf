variable "region" {
  default     = "eu-west-2"
  description = "AWS region"
}

variable "kong_tf_state_bucket" {
  default = "tf-hybrid-kong-bucket"
}

variable "kong_tf_state_lock" {
  default = "hybrid-kong-terraform-state-locking"
}

variable "kong_tf_state_key" {
  default = "kong-ta2/terraform.tfstate"
}

variable "python_web_app_namespace" {
  default = "python-web-app"
}

variable "registry_server" {
  default = "https://hub.docker.com/"
}

variable "registry_username" {
  default = "lakshmips"
}

variable "registry_password" {
  default = "D0ntask@11"
}

variable "registry_email" {
  default = "lakshmi.purushothamk@gmail.com"
}