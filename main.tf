terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
  token = var.git-token
}

resource "github_repository" "docker-repo" {
  name        = "docker-files-repository"
  description = "this repository holds the application source code and docker files"
  visibility  = "private"
  auto_init   = "true"
}

resource "github_branch" "default-branch" {
  branch     = "main"
  repository = github_repository.docker-repo.name
}

resource "github_repository_file" "myfiles" {
  for_each            = toset(var.files)
  file                = each.value
  content             = file(each.value)
  repository          = github_repository.docker-repo.name
  branch              = "main"
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

resource "aws_security_group" "tf-docker-sg" {
  name        = "docker-sg"
  description = "allow ssh and http"
  tags = {
    Name = "docker-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dockerInstance" {
  instance_type          = "t2.micro"
  ami                    = "ami-0157af9aea2eef346"
  key_name               = var.key-name
  vpc_security_group_ids = [aws_security_group.tf-docker-sg.id]

  tags = {
    Name = "Webserver-Docker-Instance"
  }

  user_data = templatefile("userdata.sh", { user-data-git-token = var.git-token, user-data-git-username = var.git-username })

  depends_on = [github_repository.docker-repo, github_repository_file.myfiles]
}

output "website-url" {
  value = "http://${aws_instance.dockerInstance.public_ip}"
}