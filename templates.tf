data "template_file" "haproxyConf" {
  # module-relative path because of "Embedded Files"
  template = "${file("${path.module}/config/haproxy.cfg.tpl")}"

  vars {
    web1_local_ip = "${aws_instance.web1.private_ip}"
    web2_local_ip = "${aws_instance.web2.private_ip}"
  }
}
