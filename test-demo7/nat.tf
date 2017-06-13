resource "aws_eip" "nat" {
	vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
	allocation_id = "${aws_eip.nat.id}"
  	subnet_id     ="${element("${aws_subnet.public_subnet.*.id}", 0)}"
  	depends_on = ["aws_internet_gateway.main_internet_gate_way"]
}

resource "aws_route_table" "route_for_nat" {
	vpc_id = "${aws_vpc.main.id}"

	route {
		cidr_block = "0.0.0.0/24"
		nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
	}

	tags {
		Name = "route_for_nat"
	}
}

resource "aws_route_table_association" "nat_route_association" {
	count =  "${length("${var.PUBLIC_CIDRS}")}"
	subnet_id = "${element("${aws_subnet.private_subnet.*.id}", count.index)}"
	route_table_id = "${aws_route_table.route_for_nat.id}"
}