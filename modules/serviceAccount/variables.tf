variable "service_account" {
    type = map(object({
      account_id = string
      display_name = string
    }))
}

variable "project_id" {
    type = string
}