resource "google_bigquery_dataset" "dataset" {
  for_each = var.database_info
  dataset_id                  = each.value["dataset_id"]
  location                    = each.value["location"]
  default_table_expiration_ms = each.value["default_table_expiration_ms"] #3600000
  delete_contents_on_destroy  = each.value["delete_contents_on_destroy"] #true

  access {
    role          = var.bigquery_access_role  #"READER"
    user_by_email = var.bq_sa
  }
  
}
