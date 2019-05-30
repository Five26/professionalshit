resource "aws_lambda_function" "myapp" {
  function_name = "myapp"
  handler = "myapp.lambda_handler"
  runtime = "python3.6"
  timeout = 300
  environment {
    variables = {
      DRY_RUN = "${var.dry_run}"
      AWS_REGIONS = "${var.aws_regions}"
    }
  }
  filename = "myapp.zip"
  source_code_hash = "${base64sha256(file("myapp.zip"))}"
  role = "${aws_iam_role.myapp_role.arn}"
  tags {
    Name = "myapp"
    ManagedBy = "terraform"
  }
}