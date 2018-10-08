# Ulimi Terraform Config

Configuration for setting up Ulimi's Terraform infrastructure. This repository also contains a guide on our usage of Terraform.


## Usage

Use the following block to use the backend created by this module:

```hcl
terraform {
  backend "s3" {
    bucket               = "ulimi-terraform-state"
    dynamodb_table       = "terraform-lock"
    key                  = "<project-name>"
    region               = "us-east-1"
    workspace_key_prefix = "<project-name>"
  }
}
```

*Note: `<project-name>` must be unique across all projects that store state in the bucket.*


## Our Usage of Terraform

We use [Terraform][terraform] to provision our infrastructure in a controllable and trackable manner. To understand more about what Terraform does, see [their introduction][terraform-overview].

### Setup

Before we can do anything with Terraform, we need to make sure it has the credentials to create the necessary resources. Since our infrastructure runs on AWS, any of the methods [described here][aws-credentials] will work.

### Basic Commands

Before running any `terraform` commands, you must first initialize whatever Terraform module you are working on:

```
terraform init
```

This command downloads all the necessary plugins required to run the code it finds. You may need to run this command again if you write code that requires additional plugins.

Terraform allows us to see what changes need to be made in our infrastructure based on the configuration that we've written and the current state of our infrastructure with the following command:

```
terraform plan
```

Once we have checked to make sure that there are no unexpected changes, we can actually apply these changes with the following command:

```
terraform apply
```


## Development of this Module

**If you make any changes to this module, make sure the sample configuration block [above](#usage) is still correct.**

This module is pretty straightforward since all the work is delegated to the [tf-s3-config][tf-s3-config] module. The biggest noteworthy aspect of this repository is that we store the `.tfstate` file in Git since this is the module that configures the S3 bucket for us to store other state files in. As such, no sensitive information should ever be handled by this Terraform configuration.


## License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for more information.


## Authors

Chathan Driehuys (chathan@driehuys.com)


[aws-credentials]: https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html
[terraform]: https://www.terraform.io/
[terraform-install]: https://www.terraform.io/downloads.html
[terraform-overview]: https://www.terraform.io/intro/index.html
[tf-s3-config]: https://github.com/ultimanager/tf-s3-config
