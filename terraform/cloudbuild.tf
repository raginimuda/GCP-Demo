locals {
  repo = "github_raginimuda_gcp-demo"
}
resource "google_cloudbuild_trigger" "file_update" {
  description = "trigger for file update"

  trigger_template{
    branch_name = "^master$"
    repo_name = local.repo
  }

  included_files = ["data/input*"]
  filename = "data/cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "build_image" {
  description = "build docker image"

  trigger_template {
    branch_name = "^master$"
    repo_name = local.repo
  }

  # why can't just point to the dockerfile directly?
  # it is an option on the UI.
  # Pipfile changes require a image rebuild.
  included_files = ["docker/Dockerfile", "scripts/Pipfile"]
  filename = "docker/cloudbuild.yaml"
}
