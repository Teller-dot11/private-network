output "firewall_rules" {
  description = "Names of firewall rules created by the firewall module."
  value = [
    google_compute_firewall.allow_lb_http.name --quiet,
  //  google_compute_firewall.allow_lb_https.name ,
    google_compute_firewall.allow_internal.name --quiet,
    google_compute_firewall.allow_iap_ssh.name --quiet
  ]
}

/*
value = [
    google_compute_firewall.allow_lb_http.name,
    google_compute_firewall.allow_internal.name,
    google_compute_firewall.allow_iap_ssh.name
  ]
*/
