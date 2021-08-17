resource "google_container_cluster" "primary" {
  name = var.gke_cluster
  location = var.gke_zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name = "${google_container_cluster.primary.name}--node-pool"
  location = var.gke_zone
  cluster = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible = true
    machine_type = "g1-small"
    disk_size_gb = 32

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.gcp_project_id
    }
  }
}