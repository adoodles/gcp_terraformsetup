resource "google_compute_instance" "default" {
  name         = "placeholder-vm"
  machine_type = var.instance_type  #to be changed or included in var.tf file
  zone         = var.gcp_zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = var.ubuntu_2004_lts
    }
  }

  metadata_startup_script = "sudo apt-get update"

  network_interface {
    network = "default"
    access_config {
        #ephemeral external IP
        }
    }
}   

# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "default-allow-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"] 
}

# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "default-allow-ssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
}