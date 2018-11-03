resource "aws_codepipeline" "foo" {
  name     = "${var.project_name}-pipeline"
  role_arn = "${aws_iam_role.codepipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.foo.bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Api_Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["${var.project_name}-api-pipeline-artifact"]

      configuration {
        Owner      = "Mark0930"
        Repo       = "apiGateway"
        Branch     = "master"
        OAuthToken = "${var.github_token}"
      }
    }

    action {
      name             = "Dynamo_Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["${var.project_name}-dynamo-pipeline-artifact"]

      configuration {
        Owner      = "Mark0930"
        Repo       = "dynamo"
        Branch     = "master"
        OAuthToken = "${var.github_token}"
      }
    }
  }

  stage {
    name = "Dev"

    action {
      name            = "Api"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["${var.project_name}-api-pipeline-artifact"]
      version         = "1"

      configuration {
        ProjectName = "${module.api_codebuild.codebuild_output}"
      }
    }

    action {
      name            = "Dynamo"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["${var.project_name}-dynamo-pipeline-artifact"]
      version         = "1"

      configuration {
        ProjectName = "${module.dynamo_codebuild.codebuild_output}"
      }
    }
  }

  stage {
    name = "Stage"

    action {
      name            = "Api"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["${var.project_name}-api-pipeline-artifact"]
      version         = "1"

      configuration {
        ProjectName = "${module.api_codebuild.codebuild_output}"
      }
    }
  }

  stage {
    name = "Prod"

    action {
      name            = "APi"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["${var.project_name}-api-pipeline-artifact"]
      version         = "1"

      configuration {
        ProjectName = "${module.api_codebuild.codebuild_output}"
      }
    }
  }
}
