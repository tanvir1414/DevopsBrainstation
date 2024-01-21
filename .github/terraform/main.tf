provider "aws" {
  region = "us-east-1"
}

module "eks_cluster" {
  source           = "terraform-aws-modules/eks/aws"
  cluster_name     = "ekscluster01"
  subnet_ids          = ["subnet-03b025ab0382b34ef", "subnet-0cfa4c78648a75ecf", "subnet-073b35b3d2a5c0390"]
  vpc_id           = "vpc-0ea115502c9893365"
  cluster_version  = "1.28"
  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t2.small"
    }
  }
}
