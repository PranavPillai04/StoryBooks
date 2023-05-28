# Get from https://registry.terraform.io/providers/hashicorp/google/latest/docs
# (Just Google terraform gcp provider)
provider "google" {
  credentials = file("terraform-sa-key.json")
  project     = "feisty-enigma-388004"
  region      = "us-central1"
  zone        = "us-central1-c"
  version     = "~> 3.38"
}

# IP ADDRESS

# NETWORK

# FIREWALL RULE

# OS IMAGE

# COMPUTE ENGINE INSTANCE
