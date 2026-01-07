output "vpc_id" {
 value = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "Name of the VPC network."
  value = google_compute_network.vpc.name
}

output "subnet_id" {
 value = google_compute_subnetwork.subnet.id
}
