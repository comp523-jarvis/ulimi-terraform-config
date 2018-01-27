module "tf-s3-config" {
  source = "github.com/ultimanager/tf-s3-config"

  aws_region = "us-east-1"
  state_bucket = "ultimanager-terraform-state"
}
