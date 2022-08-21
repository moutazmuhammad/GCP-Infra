resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.vm_type
  zone         = var.zone

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.vm_image
      size = var.vm_boot_disk_size 
      type = var.vm_boot_disk_type 
    }
  }

  tags = [var.firewall_tag]
  
  network_interface {
    subnetwork = var.subnet_self_link
  }

  service_account {
    # Google recommends custom service accounts that have cloud_platform scope and permissions granted via IAM Roles.
    email  = var.vm_sa_email # google_service_account.bigquery_admin_sa.email
    scopes = ["cloud-platform"] 
  }
}
