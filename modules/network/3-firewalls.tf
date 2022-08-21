# This firewall will allow sshing through iap only
# We don't need to create any firewalls manually for GKE

resource "google_compute_firewall" "allow_ssh" {
  project       = var.project_id
  name          = "allow-ssh-through-iap"
  description = "Firewall rule allowing access from iap range"
  network       = google_compute_network.vpc_network.name
  source_ranges = ["35.235.240.0/20"]   # This range contains all IP addresses that IAP uses for TCP forwarding.
  allow {
    protocol = "tcp"
  }

  target_tags = [ var.firewall_tag ] #"bastion-host"
}