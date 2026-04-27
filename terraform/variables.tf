variable "project_id" {
  type        = string
  description = "The project ID to host the resources."
}

variable "agent_location" {
  type        = string
  description = "The location of the Dialogflow CX agent."
  default     = "us-central1"
}

variable "datastore_location" {
  type        = string
  description = "The location of the Discovery Engine data store."
  default     = "us"
}

variable "buyer_agent" {
  type    = map(string)
  default = {
    agent_display_name = "syn-aa-dev-buyer-data-store-agent"
    agent_description  = "The agent provides guidance to the user by making use of buyer-temporal-data-store-tool."
    tool_display_name  = "buyer-temporal-data-store-tool"
    tool_description   = "the tool retrieves relevant data to ground answers for user queries"
    data_store_id      = "buyer-temporal-data-store_1776906917824"
  }
}



variable "supplier_agent" {
  type    = map(string)
  default = {
    agent_display_name = "syn-aa-dev-supplier-data-store-agent"
    agent_description  = "The agent provides guidance to the user by making use of supplier-temporal-data-store-tool"
    tool_display_name  = "supplier-temporal-data-store-tool"
    tool_description   = "the tool retrieves relevant data to ground answers for user queries"
    data_store_id      = "supplier-temporal-data-store_1776907159093"
  }
}