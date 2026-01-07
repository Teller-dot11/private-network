terraform {
 backend "gcs" {
  bucket = "private_number"
  prefix = "private/vm"
  }
}
