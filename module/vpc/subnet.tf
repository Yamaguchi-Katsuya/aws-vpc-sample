resource "aws_subnet" "public" {
  count = length(var.cidr_public)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.cidr_public, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.system}-${var.env}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.cidr_private)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.cidr_private, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.system}-${var.env}-private-${count.index + 1}"
  }
}
