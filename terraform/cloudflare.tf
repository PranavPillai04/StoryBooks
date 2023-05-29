# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# DNS zone

# DNS A record
