terraform {
  backend "gcs" {
    bucket = "feisty-enigma-388004-terraform-pranav12"
    # prefix value tells it where within the bucket to store it
    prefix = "/state/storybooks"
  }
}
