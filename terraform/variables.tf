variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "app_name" {
  type    = string
  default = "my-app"
}

variable "env_name" {
  type    = string
  default = "my-app-env"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
