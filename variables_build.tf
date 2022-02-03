# ------------------------------------------------------------------------------
# Build settings
# ------------------------------------------------------------------------------
variable "env_alias" {
  type        = string
  description = "The target environment alias."
}

variable "aws_region" {
  type        = string
  description = "The target AWS region."
}

variable "backend_hostname" {
  type        = string
  description = "The terraform backend hostname for the target VPC networking layer."
  default     = "app.terraform.io"
}

variable "backend_organization" {
  type        = string
  description = "The terraform backend organization for the target VPC networking layer."
}

variable "deployment_id" {
  type        = string
  description = "Deployment identifier for namespacing resources."
}
