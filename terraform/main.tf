terraform {
  backend "gcs" {
    bucket = "raginimd28"
    prefix = "terraform/state"
  }
}

provider "google" {
  version = "~> 2.20"
  project = "triple-team-359223"
}

# Use this data source to get project details. For more information see API.
# https://www.terraform.io/docs/providers/google/d/google_project.html
data "google_project" "project" {}
