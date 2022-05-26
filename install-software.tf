module "curl" {
    source = "./modules/install_curl"
    instance_name = "${google_compute_instance.default.name}"
    public_ip = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    depends_on = [google_compute_instance.default]
}

module "rstudio" {
    source = "./modules/install_rstudio"
    instance_name = "${google_compute_instance.default.name}"
    public_ip = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    depends_on = [google_compute_instance.default, module.curl]
}
