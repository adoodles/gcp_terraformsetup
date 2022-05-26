resource "null_resource" "default" {
    provisioner "file" {
        source = "curl.sh"
        destination = "curl.sh"
        connection {
            type = "ssh"
            user = "root"
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
            user = "root"
            host = var.public_ip
        }
    }
}