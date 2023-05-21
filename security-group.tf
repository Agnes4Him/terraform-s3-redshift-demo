resource "aws_security_group" "redshift-serverless-security-group" {
  depends_on = [aws_vpc.redshift-serverless-vpc]

  name        = "${var.env_prefix}-redshift-serverless-security-group"
  description = "my-redshift-serverless-security-group"

  vpc_id = aws_vpc.redshift-serverless-vpc.id
  
  ingress {
    description = "Redshift port"
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
  
  tags = {
    Name = "${var.env_prefix}-redshift-serverless-security-group"
  }
}