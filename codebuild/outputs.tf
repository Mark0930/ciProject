output "codebuild_output" {
  value = "${aws_codebuild_project.build_project.name}"
}
