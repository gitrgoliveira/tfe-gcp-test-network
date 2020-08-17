terraform {
  backend "remote" {
    organization = "hc-emea-sentinel-demo"
    workspaces {
      name = "tfe-gcp-test-network"
    }
  }
}