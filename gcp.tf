provider "google" {
  version = "~> 3.30"
  project = var.project
  region  = var.region

}

module "network" {
  source       = "app.terraform.io/hc-emea-sentinel-demo/network/google"
  version      = "2.4.0"
  network_name = "test-nw"
  project_id   = var.project
  subnets = [
    {
      subnet_name = "subnet-01"
      subnet_ip   = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name = "subnet-02"
      subnet_ip   = "10.10.20.0/24"
      subnet_region = var.region
    },

    {
      subnet_name = "subnet-03"
      subnet_ip   = "10.10.30.0/24"
      subnet_region = var.region
    }
  ]
  auto_create_subnetworks = true
}

