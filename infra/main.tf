terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws",
          version = "~> 3.27"
      }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = var.instance_type
  key_name      = var.ssh_key
  

  tags = {
    Name = "Terraform Ansible Python"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.ssh_key
  public_key = file("${var.ssh_key}.pub")
}