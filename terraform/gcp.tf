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
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "ip_address" {
  name = "storybooks-ip-${terraform.workspace}"
}

# VPC NETWORK
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# A data block is a reference to an already existing resource, so we'll use it and itll find it within our gcp project
data "google_compute_network" "default" {
  name = "default"
}

# FIREWALL RULE
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-${terraform.workspace}"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # Any IP, so any request on port 80 will be allowed
  source_ranges = ["0.0.0.0/0"]

  # How we attach our VM to this firewall rule
  target_tags = ["allow-http-${terraform.workspace}"]
}

# OS IMAGE
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_image
data "google_compute_image" "cos_image" {
  # container-optimzed OS, made by google to run containers
  # However, it does not have a package manager, so unable to install software onto instance
  # Configuration will need to be on container-level
  family  = "cos-81-lts"
  project = "cos-cloud"
}

# COMPUTE ENGINE INSTANCE
# This will spin up our Node.JS server
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
resource "google_compute_instance" "instance" {
  name = "${var.app_name}-vm-${terraform.workspace}"
  # variable so we can use different size machines for staging and production
  machine_type = var.gcp_machine_type
  zone         = "us-central1-a"

  # How we apply firewall rule by internal name and target tags key
  tags = google_compute_firewall.allow_http.target_tags

  # Reference OS image we defined above
  boot_disk {
    initialize_params {
      image = data.google_compute_image.cos_image.self_link
    }
  }

  network_interface {
    network = data.google_compute_network.default.name

    access_config {
      # Reference to static IP we defined above
      nat_ip = google_compute_address.ip_address.address
    }
  }

  service_account {
    # Service accounts only have storage read only access
    # Needed to read Docker image from google container registry
    scopes = ["storage-ro"]
  }
}
