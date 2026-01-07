terraform {
 backend "gcs" {
  bucket = "private-nat-bucket"
  prefix = "webserver"
  }
}
