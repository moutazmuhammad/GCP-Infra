output "sa-email" {
  value = {
    for k, v in google_service_account.service_account : k => v.email
  }
}