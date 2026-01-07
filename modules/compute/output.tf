output "instance_id" {
 value = google_compute_instance.vm.id
}

output "internal_ip" {
 value = google_compute_instance.vm.network_interface[0].network_ip
}
