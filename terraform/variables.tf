# Hashicorp Configuration Language, (alt. Pulumi uses any language)
# Notes: 
# 1. re-run init command anytime a module/provider is created or changed
# 2. synchronize time with provider's region (at least for GCP) if the JWT token is not accepted. Ref: https://askubuntu.com/questions/178968/how-to-configure-ntp-time-synchronization-on-a-server/178977#178977

### GENERAL
variable "app_name" {
  type = string
}

