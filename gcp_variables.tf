# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

# define GCP region
variable "gcp_instance_type" {
  type        = string
  description = "GCP machine type"
}