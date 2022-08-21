resource "google_storage_bucket" "my_bucket" {
    for_each      = var.buckets_info
    name          = each.value["name"]
    project       = var.project_id
    location      = each.value["location"]
    force_destroy = each.value["force_destroy"] #true
    storage_class = each.value["storage_class"]

    versioning {
        enabled = each.value["versioning"]
    }

}