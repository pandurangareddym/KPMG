resource "aws_instance" "apps_server" {
  ami                    = var.AMIS
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.t3key.key_name
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.application-sg.id]

  tags = {
    Name    = "apps_server"
    PROJECT = "tier3"
  }

  provisioner "file" {
    content     = "apps_install.sh" 
    destination = "/tmp/apps_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/apps_install.sh",
      "sudo /tmp/apps_install.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [module.vpc, aws_security_group.application-sg]
}


resource "aws_instance" "db_server" {
  ami                    = var.AMIS
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.t3key.key_name
  subnet_id              = module.vpc.public_subnets[1]
  vpc_security_group_ids = [aws_security_group.dbserver-sg.id]

  tags = {
    Name    = "middleware_server"
    PROJECT = "tier3"
  }

  provisioner "file" {
    content     = "middleware_install.sh"
    destination = "/tmp/middleware_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/middleware_install.sh",
      "sudo /tmp/middleware_install.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [module.vpc, aws_security_group.middleware-sg]
}


resource "aws_instance" "db_server" {
  ami                    = var.AMIS
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.t3key.key_name
  subnet_id              = module.vpc.public_subnets[2]
  vpc_security_group_ids = [aws_security_group.db-sg.id]

  tags = {
    Name    = "db_server"
    PROJECT = "tier3"
  }

  provisioner "file" {
    content     = "db_install.sh"
    destination = "/tmp/db_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/db_install.sh",
      "sudo /tmp/db_install.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [module.vpc, aws_security_group.db-sg]
}


