variable "database_info" {
  type = map(object({
    dataset_id = string
    location = string
    default_table_expiration_ms = number
    delete_contents_on_destroy = bool
  }))
}

variable "bigquery_access_role" {
  type = string
}

variable "bq_sa" {
  type = string
}
