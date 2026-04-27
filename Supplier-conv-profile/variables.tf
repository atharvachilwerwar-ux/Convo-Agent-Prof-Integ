variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "conversation_profile_display_name" {
  description = "Display name for the conversation profile"
  type        = string
  default     = "syn_aa_dev_supplier_chat_profile"
}

variable "location" {
  description = "Location for the conversation profile"
  type        = string
  default     = "us-central1"
}

variable "data_store_location" {
  description = "Location of the data store for knowledge assist"
  type        = string
  default     = "projects/proj-dev-aicoe-synapse/locations/us-central1/agents/syn-aa-dev-supplier-data-store-agent"
}