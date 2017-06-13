resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = "true"

	tags = {
		Name = "main"
	}
}

resource "aws_subnet" "public_subnet" {
	vpc_id = "${aws_vpc.main.id}"
	count =  "${length("${var.PUBLIC_CIDRS}")}"
	cidr_block = "${element("${var.PUBLIC_CIDRS}", count.index)}"
	availability_zone = "${element("${keys("${var.AMIS}")}", count.index)}"
	map_public_ip_on_launch = "true"
	tags {
		Name = "public_subnet-${count.index}"
	}
}


resource "aws_subnet" "private_subnet" {
	vpc_id = "${aws_vpc.main.id}"
	count =  "${length("${var.PRIVATE_CIDRS}")}"
	cidr_block = "${element("${var.PRIVATE_CIDRS}", count.index)}"
	availability_zone = "${element("${keys("${var.AMIS}")}", count.index)}"
	map_public_ip_on_launch = "false"
	tags {
		Name = "private_subnet-${count.index}"
	}
}


resource "aws_internet_gateway" "main_internet_gate_way" {
	vpc_id = "${aws_vpc.main.id}"

	tags {
		Name = "main_internet_gate_way"
	}
}


resource "aws_route_table" "main_public_route_table" {
	vpc_id = "${aws_vpc.main.id}"
	route {
		cidr_block = "0.0.0.0/16"
		gateway_id = "${aws_internet_gateway.main_internet_gate_way.id}"
	}

	tags {
		Name = "main_route_table"
	}
}

resource "aws_route_table_association" "public_route_table_association" {
	count =  "${length("${var.PUBLIC_CIDRS}")}"
	subnet_id = "${element("${aws_subnet.public_subnet.*.id}", count.index)}"
	route_table_id = "${aws_route_table.main_public_route_table.id}"
}

