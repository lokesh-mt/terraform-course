resource "aws_instance" "web" {
	instance_type = "t2.micro"
	ami = "${lookup(var.AMIS, var.AWS_REGION)}"

	provisioner "local-exec" {
		command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
	}
}

output "ip" {
	value = "${aws_instance.web.public_ip}"
}