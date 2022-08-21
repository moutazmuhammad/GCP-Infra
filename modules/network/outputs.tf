output vpc_id {
  value       = google_compute_network.vpc_network.id
}

output subnet_id {
  value       = google_compute_subnetwork.private_subnet.id
}

output "subnet_self_link" {
  value = google_compute_subnetwork.private_subnet.self_link
}

output "network_self_link" {
  value = google_compute_network.vpc_network.self_link
}
