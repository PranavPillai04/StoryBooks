terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.38"
    }
  }
}

# Get from https://registry.terraform.io/providers/hashicorp/google/latest/docs
# (Just Google terraform gcp provider)
provider "google" {
  credentials = file("terraform-sa-key.json")
  project     = "feisty-enigma-388004"
  region      = "us-central1"
  zone        = "us-central1-c"
}

# IP ADDRESS

# NETWORK

# FIREWALL RULE

# OS IMAGE

# COMPUTE ENGINE INSTANCE
