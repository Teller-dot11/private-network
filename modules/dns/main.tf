resource "google_dns_managed_zone" "private" {
  name        = "private-web-zone"
  dns_name    = "private-vpc.internal."
  description = "Private DNS zone for internal LB"
  visibility  = "private"
  networks {
    network_url = var.vpc_id
  }
}

resource "google_dns_record_set" "lb" {
  name         = var.internal_domain
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.private.name
  rrdatas      = [var.lb_ip]
}
