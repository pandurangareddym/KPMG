
  
variable AWS_REGION {
  default = "us-east-2"
}

variable AMIS {
  default = "ami-07efac79022b86107"
}

variable PRIV_KEY_PATH {
  default = "t3key"
}

variable PUB_KEY_PATH {
  default = "t3key.pub"
}

variable USERNAME {
  default = "ubuntu"
}

variable MYIP {
  default = "0.0.0.0/0"
}

variable VPC_NAME {
  default = "tier3-app-VPC"
}

variable Zone1 {
  default = "us-east-2a"
}

variable Zone2 {
  default = "us-east-2b"
}

variable Zone3 {
  default = "us-east-2c"
}

variable VpcCIDR {
  default = "172.21.0.0/16"
}


variable PrivSub1CIDR {
  default = "172.21.1.0/24"
}

variable PrivSub2CIDR {
  default = "172.21.2.0/24"
}

variable PrivSub3CIDR {
  default = "172.21.3.0/24"
}

