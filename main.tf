provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "board-game" {
  ami = "ami-026c39f4021df9abe"
  instance_type = "t2.micro"
  key_name = "ansible-terraform"
  security_groups = [aws_security_group.ap_sgs.name]

  user_data = file("scripts/user_data.sh")  

  tags = {
    Name = "BoardGameAppServer"

  
  
}

}


resource "aws_security_group" "ap_sgs" {
  name        = "boardgame_sg"
  description = "Allow 8080 and 22"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["49.36.96.111/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}