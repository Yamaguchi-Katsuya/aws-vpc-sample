resource "aws_eip" "nat_gateway" {
  count = length(var.cidr_public)
  vpc = true
  tags = {
    Name = "${var.system}-${var.env}-ngw-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "private" {
  count = length(var.cidr_public)
  allocation_id = element(aws_eip.nat_gateway.*.id, count.index)
  subnet_id = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = "${var.system}-${var.env}-ngw-private-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "ngw" {
  count = length(var.cidr_private)
  route_table_id = element(aws_route_table.private.*.id, count.index)
  nat_gateway_id = element(aws_nat_gateway.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
}
