# This Module Creates Google Kubernetes Cluster

Copy and paste below code and run terraform init , terraform apply.


```

module "app" {
    source = "../"
    // replace with your own project ID
    project = "xwibraqguembkefy"
	region = "us-central1"
	zone = "us-central1-c"
	cluster_name = "my-gke-cluster"
	machine_type = "e2-medium"
	node_count = 1
	node_pool_name = "my-node-pool"
	preemptible = true
}


```