provider "google" {
  version = "~> 3.30"
  project = var.project
  region  = var.region

}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}


module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "2.5.0"
  network_name = "test-nw-${random_id.instance_id.hex}"
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

