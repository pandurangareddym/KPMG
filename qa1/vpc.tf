module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.VPC_NAME
  cidr = var.VpcCIDR

  azs             = ["var.zone1", "var.zone2", "var.zone3"]
  private_subnets = ["var.PrivSub1CIDR", "var.PrivSub3CIDR", "var.PrivSub3CIDR"]


  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "tier3-private-subnet"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
