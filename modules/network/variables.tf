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

variable "auto_create_subnetworks" {
  type = bool
  default = false
}

variable "vpc_mtu" {
  type = number
  default = 1460
}

variable "delete_default_routes_on_create" {
  type = bool
  default = false
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
  type = bool
  default = true
}

variable "firewall_tag" {
  type = string
}