project_id       = "terraform-task-359820"
region           = "us-central1"
zone             = "us-central1-b"
cluster_zone_one = "us-central1-c"
cluster_zone_two = "us-central1-f"


vpc_name = "main-vpc"

subnet_name                 = "main-subnet"
subnet_cidr                 = "10.0.0.0/24"
kuberneres_pod_range        = "k8s-pod-range"
kuberneres_pod_ip_range     = "10.48.0.0/16"
kuberneres_service_range    = "k8s-service-range"
kuberneres_service_ip_range = "10.52.0.0/26"
private_ip_google_access    = true

firewall_tag = "bastion-host"

vm_name  = "bastion-vm"
vm_type  = "e2-small"
vm_image = "debian-cloud/debian-10"

buckets_info = {
  "bucket_one" = {
    name          = "moutaz-gcs-bucket-one"
    location      = "us-central1"
    force_destroy = true
    storage_class = "STANDARD"
    versioning    = false
  },
  "bucket_two" = {
    name          = "moutaz-gcs-bucket-two"
    location      = "us-central1"
    force_destroy = true
    storage_class = "STANDARD"
    versioning    = true
  },
  "bucket_three" = {
    name          = "moutaz-gcs-bucket-three"
    location      = "us-central1"
    force_destroy = true
    storage_class = "STANDARD"
    versioning    = true
  }
}

database_info = {
  "database-one" = {
    dataset_id                  = "moutaz_bigquery_database_one"
    location                    = "us-central1"
    default_table_expiration_ms = 3600000
    delete_contents_on_destroy  = true
  },
  "database-two" = {
    dataset_id                  = "moutaz_bigquery_database_two"
    location                    = "us-central1"
    default_table_expiration_ms = 3600000
    delete_contents_on_destroy  = true
  },
  "database-three" = {
    dataset_id                  = "moutaz_bigquery_database_three"
    location                    = "us-central1"
    default_table_expiration_ms = 3600000
    delete_contents_on_destroy  = true
  }
}

cluster_name   = "my-cluster"
node_pool_name = "node-pool"
nodes_count    = 2
nodes_type     = "e2-medium"

service_account = {
  "sa-one" = {
    account_id   = "vm-service-account"
    display_name = "vm-service-account"
  },
  "sa-two" = {
    account_id   = "claster-service-account"
    display_name = "claster-service-account"
  },
}

bigquery_access_role = "OWNER"