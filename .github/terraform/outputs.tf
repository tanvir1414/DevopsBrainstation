output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_name" {
  description = "Cluster name associated with the EKS cluster"
  value       = module.eks_cluster.cluster_name
}
