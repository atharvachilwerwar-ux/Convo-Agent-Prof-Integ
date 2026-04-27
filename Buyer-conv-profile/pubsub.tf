data "google_pubsub_topic" "agent_assist" { 
    name = "syn-aa-dev-new-suggestion-topic" 
}

data "google_pubsub_topic" "lifecycle"    {
    name = "syn-aa-dev-conversation-event-topic" 
}

data "google_pubsub_topic" "new_message"   { 
    name = "syn-aa-dev-new-message-topic" 
}

data "google_pubsub_topic" "transcription" { 
    name = "syn-aa-dev-intermediate-transcript-topic" 
}