terraform {
  backend "gcs" {
    prefix = "terraform/state/ncp-active"
  }
}
