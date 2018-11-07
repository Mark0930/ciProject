module "codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}"
}

module "api_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-api-dev-codebuild"
  environment="dev"
}

module "api_stage_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-api-stage-codebuild"
  environment="stage"
}

module "api_prod_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-api-prod-codebuild"
  environment="prod"
}

module "dynamo_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-dynamo-dev-codebuild"
  environment="dev"
}

module "dynamo_stage_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-dynamo-stage-codebuild"
  environment="stage"
}

module "dynamo__prod_codebuild" {
  source  = "codebuild"
  project_name= "${var.project_name}-dynamo-prod-codebuild"
  environment="prod"
}
