variable "vpc_flow_log_group_arn" {}
variable "vpc_id" {}
variable "vpc_flow_log_iam_role_arn" {}

resource "aws_flow_log" "vpc_flow_log" {
  log_destination_type     = "cloud-watch-logs"
  log_destination          = var.vpc_flow_log_group_arn
  traffic_type             = "ALL"
  vpc_id                   = var.vpc_id
  iam_role_arn             = var.vpc_flow_log_iam_role_arn
  max_aggregation_interval = 60
}
