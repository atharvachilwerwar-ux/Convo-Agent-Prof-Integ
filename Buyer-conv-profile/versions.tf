terraform {
  required_version = ">= 1.0"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0" # Updated to the newest version
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 7.0" # Updated to the newest version
    }
  }
}

provider "google" {
  project               = var.project_id
  region                = var.region
  # Tell GCP to use this project for API quotas:
  billing_project       = var.project_id
  user_project_override = true
}

provider "google-beta" {
  project               = var.project_id
  region                = var.region
  # Tell GCP to use this project for API quotas:
  billing_project       = var.project_id
  user_project_override = true
}