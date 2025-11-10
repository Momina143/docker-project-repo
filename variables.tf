variable "git-token" {
  description = "provide git-token in terraform.tfvars"
}

variable "git-username" {
  description = "provide git username in terraform.tfvars"
}

variable "key-name" {
  description = "provide keyname in terraform.tfvars"
}

variable "files" {
  description = "files to upload to this repo for userdata.sh to use later"
}
