variable "project_id" {
  type = string
}

variable "iam_member" {
  type = map(object({
    role = string
    member = string
  }))
}