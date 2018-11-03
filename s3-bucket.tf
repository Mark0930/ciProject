resource "aws_s3_bucket" "foo" {
  bucket        = "${var.project_name}-storage-bucket"
  acl           = "private"
  force_destroy = true
}
