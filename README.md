# terraform-aws-ec2-bitcoin-electrs-node

Terraform module for a bitcoind + electrs node (AWS EC2).

## Table of Contents

* [Introduction][section-introduction]
* [Usage][section-usage]
* [Inputs][section-inputs]
* [Requirements][section-requirements]
* [Providers][section-providers]
* [License][section-license]


## Introduction

[TBC]

> **NOTE**: This module depends upon the deployment of the `aws-networking-infra-chainhub` networking layer.


## Usage

Example of a mainnet configuration:

```
module "node-btc-mainnet" {
  source = "github.com/liquality/terraform-aws-ec2-bitcoin-electrs-node.git?ref=tags/v0.0.1"

  # The target environment
  env_alias            = "chainhub"
  aws_region           = "us-east-1"
  backend_organization = "liquality"

  # Node identifier
  chain_network_name = "mainnet"

  # Bitcoin settings
  bitcoin_ebs_volume_id   = "vol-0ab12345a22222z"
  bitcoin_ebs_volume_name = "data-bitcoin-mainnet"

  # Electrs settings
  electrs_ebs_volume_id   = "vol-0bb12345e11111z"
  electrs_ebs_volume_name = "data-bitcoin-electrs-mainnet"

  # EC2 settings
  ec2_instance_type     = "t2.xlarge"
  ec2_ami_id            = "ami-03db9b2aac6af477d"
}
```


## Inputs

[TBC]


## Requirements

[TBC]


## Providers

| Name    | Version |
| ------- | ------- |
| aws     | >= 3.38 |


## License

[TBC]



[section-introduction]: #introduction
[section-usage]: #usage
[section-inputs]: #inputs
[section-requirements]: #requirements
[section-providers]: #providers
[section-license]: #license
