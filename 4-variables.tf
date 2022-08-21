variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}


variable "vpc_name" {
  type = string
}


variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "kuberneres_pod_range" {
  type = string
}

variable "kuberneres_pod_ip_range" {
  type = string
}

variable "kuberneres_service_range" {
  type = string
}

variable "kuberneres_service_ip_range" {
  type = string
}

variable "private_ip_google_access" {
  type    = bool
  default = true
}

variable "firewall_tag" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_type" {
  type = string
}

variable "vm_image" {
  type = string
}

variable "buckets_info" {
  type = map(object({
    name          = string
    location      = string
    force_destroy = bool
    storage_class = string
    versioning    = bool
  }))
}

variable "database_info" {
  type = map(object({
    dataset_id                  = string
    location                    = string
    default_table_expiration_ms = number
    delete_contents_on_destroy  = bool
  }))
}

variable "cluster_name" {
  type = string
}

variable "node_pool_name" {
  type = string
}

variable "nodes_count" {
  type = number
}

variable "nodes_type" {
  type = string
}


variable "cluster_zone_one" {
  type = string
}

variable "cluster_zone_two" {
  type = string
}


variable "service_account" {
  type = map(object({
    account_id   = string
    display_name = string
  }))
}

variable "bigquery_access_role" {
  type = string
}