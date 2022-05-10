resource "aws_security_group" "application-sg" {
  name        = "application-sg"
  description = "Security group for application layer"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["var.PrivSub1CIDR"]
  }
}

resource "aws_security_group" "middleware-sg" {
  name        = "middleware-sg"
  description = "Security group for middleware"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["var.PrivSub1CIDR"]
  }
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["var.PrivSub2CIDR"]
  }
}

resource "aws_security_group" "database-sg" {
  name        = "database-sg"
  description = "Security group for database"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["var.PrivSubi2CIDR"]
  }
  ingress {
    from_port       = 1251
    protocol        = "tcp"
    to_port         = 1251
    security_groups = [aws_security_group.middleware-sg.id]
  }
}

