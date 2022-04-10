resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.system}-${var.env}-igw"
  }
}

resource "aws_route" "igw" {
  count = length(var.cidr_public)
  route_table_id = element(aws_route_table.public.*.id, count.index)
  gateway_id = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}
