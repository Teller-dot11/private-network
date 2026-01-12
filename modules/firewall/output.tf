output "firewall_rules" {
  description = "Names of firewall rules created by the firewall module."
  value = [
    google_compute_firewall.allow_lb_http.name,
    google_compute_firewall.allow_lb_https.name ,
    google_compute_firewall.allow_internal.name,
    google_compute_firewall.allow_iap_ssh.name
  ]
}

/*
value = [
    google_compute_firewall.allow_lb_http.name,
    google_compute_firewall.allow_internal.name,
    google_compute_firewall.allow_iap_ssh.name
  ]
*/
