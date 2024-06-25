provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

provider "aws" {
  region                   = "eu-north-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
  alias = "eun1"
}