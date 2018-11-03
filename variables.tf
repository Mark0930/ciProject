variable "github_token" {
  type    = "string"
  default = "fb8a26f8408a20e0cdcf3d8e27e87b1215b29ae5"
}

variable "project_name" {
  default = "string"
  default = "marktest"
}

provider "github" {
  token        = "${var.github_token}"
}
