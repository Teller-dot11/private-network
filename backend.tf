terraform {
 backend "gcs" {
  bucket = "private_number"
  prefix = "loadbalancer"
  }
}
