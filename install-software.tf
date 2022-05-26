module "curl" {
    source = "./modules/install_curl"
    instance_name = "${google_compute_instance.default.name}"
    depends_on = [google_compute_instance.default]
}

module "rstudio" {
    source = "./modules/install_rstudio"
    instance_name = "${google_compute_instance.default.name}"
    depends_on = [google_compute_instance.default, curl]
}
