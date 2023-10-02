# create vpc
resource "aws_vpc" "ntier" {
  cidr_block         = var.cidr_block
        tags         = {
            "Name"   ="ntier_vpc"
  }
}

 resource "aws_subnet" "subnets" {
          vpc_id    = aws_vpc.ntier.id
          count     = length(var.subnet_name_tags)
         cidr_block = cidrsubnet(var.cidr_block,8,count.index)
               tags = {
             "Name" =var.subnet_name_tags[count.index]
}
  availability_zone = var.subnet_azs[count.index]
}