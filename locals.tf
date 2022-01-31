locals {
  node_alias         = "node-bitcoin-electrs-${var.chain_network_name}${var.deployment_id}"
  vpc_workspace_name = "aws-networking-infra-${var.env_alias}"
}

locals {
  tags = {
    environment   = var.env_alias
    chain_service = "bitcoin-electrs-node"
    chain         = "btc"
    chain_network = var.chain_network_name
  }
}
