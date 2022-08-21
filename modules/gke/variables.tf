variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "remove_default_node_pool" {
    type = bool
    default = true
}

variable "initial_node_count" {
    type = number
    default = 1
}

variable "network_self_link" {
  type = string
}

variable "subnet_self_link" {
  type = string
}

variable "release_channel" {
    type = string
    default = "REGULAR"
}

variable "project_id" {
  type = string
}

variable "kuberneres_pod_range" {
  type = string
}

variable "kuberneres_service_range" {
  type = string
}

variable "enable_private_nodes" {
    type = bool
    default = true
}

variable "enable_private_endpoint" {
    type = bool
    default = true
}

variable "master_ipv4_cidr_block" {
    type = string
    default = "172.16.0.0/28"
}

variable "node_pool_name" {
  type = string
}

variable "nodes_count" {
    type = number
}


variable "cluster_zone_one" {
  type = string
}

variable "cluster_zone_two" {
  type = string
}

variable "node_config_preemptible" {
    type = bool
    default = false
}

variable "nodes_type" {
    type = string
}

variable "node_disk_size_gb" {
    type = number
    default = 100
}

variable "gke_cluster_sa_email" {
  type = string
}

variable "cidr_blocks" {
  type = string
}