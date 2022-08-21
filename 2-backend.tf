# You must create bucket with name "backend-state-file-bucket" 
# from consol (change the name if it exists)
terraform {
  backend "gcs" {
    bucket = "backend-statefile-bucket" # this bucket is made manually
    prefix = "terraform/state"
  }
}