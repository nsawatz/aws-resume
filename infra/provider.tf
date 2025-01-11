terraform {
    required_providers {
        aws = {
            version ="5.82.2"
            source = "hashicorp/aws"
        }
    }
}
provider "aws" {
    profile = "default"
    region = "us-east-2"
}