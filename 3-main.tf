module "network" {
  source                      = "./modules/network"
  project_id                  = var.project_id
  region                      = var.region
  zone                        = var.zone
  vpc_name                    = var.vpc_name
  subnet_name                 = var.subnet_name
  subnet_cidr                 = var.subnet_cidr
  kuberneres_pod_range        = var.kuberneres_pod_range
  kuberneres_pod_ip_range     = var.kuberneres_pod_ip_range
  kuberneres_service_range    = var.kuberneres_service_range
  kuberneres_service_ip_range = var.kuberneres_service_ip_range
  firewall_tag                = var.firewall_tag
}

module "vm" {
  source           = "./modules/computeMachine"
  project_id       = var.project_id
  zone             = var.zone
  vm_name          = var.vm_name
  vm_type          = var.vm_type
  vm_image         = var.vm_image
  subnet_self_link = module.network.subnet_self_link
  firewall_tag     = var.firewall_tag
  vm_sa_email      = module.serviceAccount.sa-email["sa-one"]
}

module "bucket" {
  source       = "./modules/cloudStorage"
  project_id   = var.project_id
  buckets_info = var.buckets_info
}

module "bucket_member" {
  source = "./modules/cloudStorageMember"
  bucket_members = {
    "bucket-one-member" = {
      bucket = module.bucket.bucket_name["bucket_one"]
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-one"]}"
      role   = "roles/storage.objectViewer"
    },
    "bucket-two-member" = {
      bucket = module.bucket.bucket_name["bucket_two"]
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-one"]}"
      role   = "roles/storage.objectViewer"
    },
    "bucket-three-member" = {
      bucket = module.bucket.bucket_name["bucket_three"]
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-one"]}"
      role   = "roles/storage.objectCreator"
    }
  }
}

module "database_info" {
  source               = "./modules/bigquery"
  database_info        = var.database_info
  bigquery_access_role = var.bigquery_access_role
  bq_sa                = module.serviceAccount.sa-email["sa-one"]
}

module "gke" {
  source                   = "./modules/gke"
  cluster_name             = var.cluster_name
  region                   = var.region
  network_self_link        = module.network.network_self_link
  subnet_self_link         = module.network.subnet_self_link
  cluster_zone_one         = var.cluster_zone_one
  cluster_zone_two         = var.cluster_zone_two
  project_id               = var.project_id
  cidr_blocks              = "${module.vm.vm-private_ip}/32"
  kuberneres_pod_range     = var.kuberneres_pod_range
  kuberneres_service_range = var.kuberneres_service_range
  node_pool_name           = var.node_pool_name
  nodes_count              = var.nodes_count
  nodes_type               = var.nodes_type
  gke_cluster_sa_email     = module.serviceAccount.sa-email["sa-two"]
}

module "serviceAccount" {
  source          = "./modules/serviceAccount"
  project_id      = var.project_id
  service_account = var.service_account
}

module "iam-member" {
  source     = "./modules/iam-member"
  project_id = var.project_id
  iam_member = {
    "role-one" = {
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-one"]}"
      role   = "roles/storage.admin"
    },
    "role-two" = {
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-one"]}"
      role   = "roles/container.admin"
    },
    "role-three" = {
      member = "serviceAccount:${module.serviceAccount.sa-email["sa-two"]}"
      role   = "roles/storage.admin"
    }
  }
}