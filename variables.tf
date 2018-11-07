variable "project_name" {
  default = "string"
  default = "marktest"
}

variable "environment" {
  default = "string"
}

provider "github" {
  token        = "${var.github_token}"
}
