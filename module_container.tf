module "codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}"
}

module "api_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-api-codebuild"
}
