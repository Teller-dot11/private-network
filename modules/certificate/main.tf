
resource "google_certificate_manager_dns_authorization" "dns_auth" {
  // name   = "${var.domain}-dns-auth"
  name = substr(replace(var.domain, "/[^a-z0-9-]/", "-"), 0, 63)
  domain = var.domain
}

resource "google_certificate_manager_certificate" "cert" {
 //  name = "${var.domain}-cert"
  name = substr(replace(var.domain, "/[^a-z0-9-]/", "-"), 0, 63)

  managed {
    domains = [var.domain]
    dns_authorizations = [
      google_certificate_manager_dns_authorization.dns_auth.id
    ]
  }
}
