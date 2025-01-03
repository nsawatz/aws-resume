terraform {
    required_providers {
        aws = {
            version ="≥4.9.0"
            source = "hashicorp/aws"
        }
    }
}
provider "aws" {
    profile = "your_cli_profile"
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    Region = "ca-central-1"
}