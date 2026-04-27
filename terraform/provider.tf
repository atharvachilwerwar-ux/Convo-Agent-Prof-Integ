terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.15.0"
    }
  }
}

provider "google" {
  project = var.project_id
  user_project_override = true
  billing_project       = var.project_id
}