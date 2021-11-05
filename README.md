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
  env_alias  = "chainhub"
  aws_region = "us-east-1"

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
