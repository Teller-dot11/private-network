resource "google_compute_instance_group" "group" {
 name = var.group_name //"web-group"
 zone = var.zone
 instances = [var.instance_id]

 named_port {
  name = "http"
  port = 80
  }
 named_port {
  name = "https"
  port = 443
  }
}

resource "google_compute_health_check" "hc" {
 name = var.hc_name //"http-hc"

 http_health_check {
  port = 80
  }
 }

resource "google_compute_backend_service" "backend" {
 name = var.backend_name //"web-backend"
 protocol = "HTTP"
 port_name = "http"
 health_checks = [google_compute_health_check.hc.id]

 backend {
  group = google_compute_instance_group.group.id
}
}

resource "google_compute_url_map" "map" {
 name = var.url_name //"url-map"
 default_service = google_compute_backend_service.backend.id
}

resource "google_compute_target_http_proxy" "proxy" {
 name = var.proxy_name //"http-proxy"
 url_map = google_compute_url_map.map.id
}

resource "google_compute_global_forwarding_rule" "rule" {
 name = var.rule_name //"http-rule"
 target = google_compute_target_http_proxy.proxy.id
 port_range = "80"
}
/*
resource "google_certificate_manager_certificate" "https_cert" {
  name     = "web-cert"
  description = "Managed certificate for web LB"
  managed {
    domains = [var.domain]
  }
}
*/
resource "google_compute_managed_ssl_certificate" "managed_cert" {
  // name = "web-managed-cert"
  name = substr(replace(var.domain, "/[^a-z0-9-]/", "-"), 0, 63)
  
  managed {
    domains = [var.domain]  # <- Your public domain here
  }
}
resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "https-proxy"
  url_map          = google_compute_url_map.map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.managed_cert.id]
}

resource "google_compute_global_address" "lb_ip" {
  name = "web-lb-ip"
}

resource "google_compute_global_forwarding_rule" "https_rule" {
  name       = "${var.rule_name}-https"
  target    = google_compute_target_https_proxy.https_proxy.id
  port_range = "443"
  ip_address = google_compute_global_address.lb_ip.address
}

