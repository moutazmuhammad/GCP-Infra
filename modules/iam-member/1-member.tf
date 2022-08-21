resource "google_project_iam_member" "member" {
  for_each = var.iam_member
  project = var.project_id
  role    = each.value["role"]
  member  = each.value["member"]
}