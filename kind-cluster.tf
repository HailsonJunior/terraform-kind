provider "kind" {
}

resource "kind_cluster" "giropops-cluster" {
  name           = "giropops"
  wait_for_ready = true
  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    
    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]
    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }
  }
}
