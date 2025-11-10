terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }

    github = {
        source = "integrations/github"
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
  name = "docker-files-repository"
  description = "this repository holds the application source code and docker files"
  visibility = "private"
  auto_init = "true"
}

resource "github_branch" "default-branch" {
  branch = "main"
  repository = github_repository.docker-repo.name
}

resource "github_repository_file" "myfiles" {
  for_each = toset(var.files)
  file = each.value
  content = file(each.value)
  repository = github_repository.docker-repo.name
  branch = "main"
  commit_message = "Managed by Terraform"
  overwrite_on_create = true
}

resource "" "name" {
  
}