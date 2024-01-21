terraform {
  backend "s3" {
    bucket         = "brainbuck01"
    key            = "eks-cluster/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
