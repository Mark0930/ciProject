variable "project_name" {
  default = "string"
  default = "marktest"
}

provider "github" {
  token        = "${var.github_token}"
}
