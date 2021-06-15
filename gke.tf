resource "google_container_cluster" "primary" {
	name = var.cluster_name
	location = var.region
	remove_default_node_pool = false
	initial_node_count = 1
	master_auth {
		username = ""
		password = ""
	client_certificate_config {
		issue_client_certificate = false
		}
	}
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
	name = var.node_pool_name
	location = var.region
	cluster = google_container_cluster.primary.name
	node_count = var.node_count
	node_config {
		preemptible = var.preemptible
		machine_type = var.machine_type
	metadata = {
		disable-legacy-endpoints = "true"
	}
	oauth_scopes = [
	"https://www.googleapis.com/auth/cloud-platform"
		]
	}
}

