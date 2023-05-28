terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 0.6"
    }
  }
}

# https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs
provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
}

# cluster

# db user

# ip whitelist
