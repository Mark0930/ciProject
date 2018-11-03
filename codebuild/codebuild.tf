resource "aws_codebuild_project" "build_project" {
  name          = "${var.project_name}-project-build"
  description   = "The CodeBuild project for basic"
  service_role  = "${aws_iam_role.codebuild_assume_role.arn}"
  build_timeout = "60"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/nodejs:6.3.1"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }
}
