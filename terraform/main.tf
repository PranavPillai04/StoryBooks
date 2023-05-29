terraform {
  backend "gcs" {
    bucket = "feisty-enigma-388004-terraform-pranav12"
    # prefix value tells it where within the bucket to store it
    prefix = "/state/storybooks"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.38"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 0.6"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
