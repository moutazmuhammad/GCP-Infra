resource "google_service_account" "service_account" {
  for_each = var.service_account
  account_id   = each.value["account_id"]
  display_name = each.value["display_name"]
  project = var.project_id
}