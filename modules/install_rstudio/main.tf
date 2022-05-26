resource "google_compute_instance" "default" {
    boot_disk{
        source = var.instance_name
    }
    provisioner "file" {
        source = "rstudio_2022022-485.sh"
        destination = "rstudio_2022022-485.sh"
        connection {
            type = "ssh"
            user = "ubuntu"
        }
    }

    provisioner "remote-exec" {
        inline = [
          "chmod +x ~/rstudio_2022022-485.sh",
          "cd ~",
          "./rstudio_2022022-485.sh"
        ]
        connection {
            type = "ssh"
            user = "ubuntu"
            private_key = "${file("~/.ssh/google_compute_engine")}"
        }
    }
}