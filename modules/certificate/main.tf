
resource "google_certificate_manager_dns_authorization" "dns_auth" {
  name   = "${var.domain}-dns-auth"
  domain = var.domain
}

resource "google_certificate_manager_certificate" "cert" {
  name = "${var.domain}-cert"

  managed {
    domains = [var.domain]
    dns_authorizations = [
      google_certificate_manager_dns_authorization.dns_auth.id
    ]
  }
}
