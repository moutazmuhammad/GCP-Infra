variable "zone" {
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

variable "subnet_self_link" {
  type = string
}

variable "project_id" {
  type = string
}

variable "firewall_tag" {
  type = string
}

variable "vm_boot_disk_size" {
  type = number
  default = 100
}

variable "vm_boot_disk_type" {
  type = string
  default = "pd-standard"
}

variable "vm_sa_email" {
  type = string
}