resource "google_compute_router" "router" {
 name = var.router_name //"nat-router"
 network = var.network_id
 region = var.region
}

resource "google_compute_router_nat" "nat" {
 name = var.nat_name //"cloud-nat"
 router = google_compute_router.router.name
 region = var.region
 nat_ip_allocate_option = "AUTO_ONLY"
 source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
