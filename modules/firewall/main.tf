/*
resource "google_compute_firewall" "allow_lb_http" {
  name = "allow-lb-http"
 // network = var.network_name
  network = var.network_id

  direction = "INGRESS"
  priority = 1000

  source_ranges = var.lb_health_check_ranges

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  target_tags = var.target_tags
}
*/

############################################
# Allow HTTPS from Load Balancer
############################################
resource "google_compute_firewall" "allow_lb_https" {
  name    = "allow-lb-https"
 // network = var.network_name
  network = var.network_id

  direction = "INGRESS"
  priority  = 1000

  source_ranges = var.lb_health_check_ranges

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = var.target_tags
}

############################################
# Allow Internal VPC Traffic
############################################
resource "google_compute_firewall" "allow_internal" {
  name = "allow-internal"
  network = var.network_id
 // network = var.network_name

  direction = "INGRESS"
  priority = 1000

  source_ranges = [var.internal_cidr]

  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }
}

############################################
# Allow SSH via IAP Only
############################################
resource "google_compute_firewall" "allow_iap_ssh" {
  name = "allow-iap-ssh"
  network = var.network_id
//  network = var.network_name

  direction = "INGRESS"
  priority = 1000

  source_ranges = var.iap_ssh_ranges

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  target_tags = var.target_tags
}
