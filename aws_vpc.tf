# ------------------------------------------------------------------------------
# VPC access
# ------------------------------------------------------------------------------

# Remote state of VPC
data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    hostname     = var.backend_hostname
    organization = var.backend_organization
    workspaces = {
      name = local.vpc_workspace_name
    }
  }
}
