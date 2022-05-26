resource "null_resource" "default" {
    provisioner "local-exec" {
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
          "chmod +x ~/curl.sh",
          "cd ~",
          "./curl.sh"
        ]
        connection {
            type = "ssh"
            user = "root"
            host = var.public_ip
        }
    }
}
