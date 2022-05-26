resource "null_resource" "default" {
    provisioner "file" {
        source = "rstudio_2022022-485.sh"
        destination = "rstudio_2022022-485.sh"
        connection {
            type = "ssh"
            user = "ubuntu"
            host = var.public_ip
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
            host = var.public_ip
        }
    }
}