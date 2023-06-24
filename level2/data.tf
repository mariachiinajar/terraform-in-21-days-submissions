data "terraform_remote_state" "level1" {
  backend = "s3"

  config = {
    bucket = "terraform-revision"
    key    = "level1-revision.tfstate"
    region = "us-east-1"
  }
}

