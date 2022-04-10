resource "aws_route_table" "public" {
  count = length(var.cidr_public)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.system}-${var.env}-public-rt-${count.index + 1}"
  }
}
resource "aws_route_table_association" "public" {
  count = length(var.cidr_public)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table" "private" {
  count = length(var.cidr_private)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.system}-${var.env}-private-rt-${count.index + 1}"
  }
}
resource "aws_route_table_association" "private" {
  count = length(var.cidr_private)
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
