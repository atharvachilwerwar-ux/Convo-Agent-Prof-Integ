output "conversation_profile_id" {
  description = "The unique ID of the created Conversation Profile."
  value       = google_dialogflow_conversation_profile.syn_aa_dev_buyer_chat_profile.id
}

output "conversation_profile_name" {
  description = "The full resource name/path of the Conversation Profile."
  value       = google_dialogflow_conversation_profile.syn_aa_dev_buyer_chat_profile.name
}