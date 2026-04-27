# Terraform Configuration for Dialogflow CX Conversation Profile

This Terraform configuration creates a conversation profile for CX Agent Studio with the following features:

- Pub/Sub topics for notifications (agent assist, new message, transcription, lifecycle)
- Human agent assistant configuration with sentiment analysis
- Knowledge assist and proactive suggestions

## Prerequisites

- Google Cloud Project with Dialogflow CX API enabled
- Terraform >= 1.0
- Google Cloud credentials configured

## Usage

1. Update `terraform.tfvars` with your project ID and other variables.
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`

## Files

- `main.tf`: Main configuration with conversation profile resource
- `pubsub.tf`: Pub/Sub topics
- `providers.tf`: Provider configuration
- `variables.tf`: Variable definitions
- `versions.tf`: Terraform and provider versions
- `terraform.tfvars`: Variable values