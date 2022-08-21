output "bucket_name" {
  value = {
    for k, v in google_storage_bucket.my_bucket : k => v.name
  }
}