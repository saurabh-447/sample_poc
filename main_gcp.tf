provider "google" {
# credentials = "/home/ACN-Innov-PoC-11b405c1cf2f.json"
 project     = "acn-innov-poc-243602"
 region      = "us-east1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
 zone      = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.vpc_network.self_link}"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
} 

