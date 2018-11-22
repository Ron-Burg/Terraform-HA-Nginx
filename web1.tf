resource "aws_instance" "web1" {
  ami           = "ami-0bdf93799014acdc4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.TfDemo1Subnet.id}"
  private_ip = "10.0.1.11"
  associate_public_ip_address = true
  key_name = "${var.aws_key_name}"
  # Must use vpc_security_group_ids because not default VPC
  vpc_security_group_ids = [
    "${aws_security_group.web.id}",
    "${aws_security_group.sshMgmt.id}",
    "${aws_security_group.allowPing.id}"
  ]
  tags {
    Name = "Web1"
  }

  provisioner "remote-exec" {
    # Allow provisioner to login using ssh key
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file(var.private_key)}"
      timeout = "3m"
    }
    # Install nginx on setup
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
