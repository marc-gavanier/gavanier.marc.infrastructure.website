# Client infrastructure

## About

Client infrastructure describes resources involved in client part of [Marc Gavanier personal website](https://marc.gavanier.io).

> This repository is NOT required for local development.

## Table of contents

- 🪧 [About](#about)
- 📦 [Prerequisites](#prerequisites)
- 🚀 [Installation](#installation)
- 🛠️ [Usage](#usage)
- 🤝 [Contribution](#contribution)
- 🏗️ [Built with](#built-with)
- 📝 [Licence](#licence)

## Prerequisites

- [Docker](https://www.docker.com/) or [Terraform CLI](https://www.terraform.io/cli)

## Installation

The following command allows to use the Terraform command line via Docker:
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

For simplified use, you can create an alias:
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Using this alias, there is no longer any difference between a terraform command executed via Docker or via Terraform CLI.

## Usage

### Check and fix `.tf` files format

```shell
terraform fmt
```

### Verify ressources consistency

```shell
terraform validate
```

### Retrieve Terraform Cloud authentication token locally

```shell
terraform login
```

### Initialize state and plugins locally

```shell
terraform init
```

### Plan a run to check differences between the current and the next infrastructure state to be deployed

```shell
terraform plan
```

## Contribution

### Apply the next state of the infrastructure

Simply push the changes to the `main` branch, to apply the next state of the infrastructure in production.

## Built with

### Langages & Frameworks

- [Terraform](https://www.terraform.io/) is an infrastructure as code software tool that allow to define and provide infrastructure using a declarative configuration language

### Tools

#### CI

- [Github Actions](https://docs.github.com/en/actions) is the continuous integration and deployment tool provided by GitHub
  - Deployment history is available [under Actions tab](https://github.com/marc-gavanier/marc-gavanier-client-infrastructure/actions)
- Repository secrets:
  - `TF_API_TOKEN`: Terraform Cloud API token which allows the CI to operate actions on Terraform Cloud

#### Deployment

- [Terraform Cloud](https://app.terraform.io/) is a cloud platform provided by HashiCorp to host Terraform infrastructure state and apply changes
  - Organization : [marc-gavanier](https://app.terraform.io/app/marc-gavanier/workspaces)
  - Workspaces : `marc-gavanier-client-*`
    - [marc-gavanier-client-production](https://app.terraform.io/app/marc-gavanier/workspaces/marc-gavanier-client-production)
- [AWS](https://aws.amazon.com/) is a cloud provider platform provided by Amazon
  - User : `marc-gavanier.infrastructure.client`
  - Group : `client.deployer`

## Licence

See [LICENSE.md](./LICENSE.md) file in this repository.
