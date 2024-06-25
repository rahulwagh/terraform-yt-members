variable "log_group_name" {}
variable "tags" { type = map(any)}

output "dev_proj_1_log_group_arn" {
  value = aws_cloudwatch_log_group.dev_proj_1_log_group.arn
}

resource "aws_cloudwatch_log_group" "dev_proj_1_log_group" {
  name = var.log_group_name

  tags = var.tags
}