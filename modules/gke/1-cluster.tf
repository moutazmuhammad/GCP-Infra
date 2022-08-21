resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.region
  remove_default_node_pool = var.remove_default_node_pool #true
  initial_node_count       = var.initial_node_count #1
  network                  = var.network_self_link
  subnetwork               = var.subnet_self_link
#   networking_mode          = "VPC_NATIVE"
  # Optional, if you want multi-zonal cluster
  node_locations = [
    var.cluster_zone_one,
    var.cluster_zone_two
  ]
  
  release_channel {  #  upgrades for the Kubernetes control  plane
    channel = var.release_channel #"REGULAR"
  }

  # To Make Sure service account inside cluster  Workload Identity 
  # allows Kubernetes service accounts to act as a user-managed Google IAM Service Account.
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  master_authorized_networks_config {
    cidr_blocks {
        cidr_block = var.cidr_blocks
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.kuberneres_pod_range
    services_secondary_range_name = var.kuberneres_service_range
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes #true
    enable_private_endpoint = var.enable_private_endpoint #true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block #"172.16.0.0/28"
  }

}