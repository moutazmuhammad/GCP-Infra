variable "project_id" {
    type = string
}

variable "buckets_info" {
  type =map(object({
    name = string
    location = string 
    force_destroy = bool
    storage_class = string
    versioning = bool
  }))
}