resource "google_compute_subnetwork" "private_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.vpc_network.id

  secondary_ip_range {   # For Pods of cluster
    range_name    = var.kuberneres_pod_range 
    ip_cidr_range = var.kuberneres_pod_ip_range #"10.48.0.0/16"
  }

  secondary_ip_range { # For services of cluster
    range_name    = var.kuberneres_service_range 
    ip_cidr_range = var.kuberneres_service_ip_range #"10.52.0.0/26"
  }

  private_ip_google_access = var.private_ip_google_access
}