resource "google_dialogflow_conversation_profile" "syn_aa_dev_buyer_chat_profile" {
  provider     = google-beta 
  display_name = var.conversation_profile_display_name
  location     = var.location

  # ==========================================
  # TOP-LEVEL NOTIFICATIONS
  # ==========================================

  # 1. Conversation Lifecycle Notifications
  notification_config {
    topic          = data.google_pubsub_topic.lifecycle.id
    message_format = "JSON"
  }

  # 2. New Message Notifications
  new_message_event_notification_config {
    topic          = data.google_pubsub_topic.new_message.id
    message_format = "JSON"
  }

  # 3. Intermediate Transcription (Recognition)
  new_recognition_result_notification_config {
    topic          = data.google_pubsub_topic.transcription.id
    message_format = "JSON"
  }

  # ==========================================
  # AGENT ASSIST FEATURES & SETTINGS
  # ==========================================
  human_agent_assistant_config {
    
    # 4. Agent Assist Notifications (Must be nested here)
    notification_config {
      topic          = data.google_pubsub_topic.agent_assist.id
      message_format = "JSON"
    }

    # Sentiment Analysis
    message_analysis_config {
      enable_sentiment_analysis = true
    }

    # Combined Features: Summarization & Knowledge Assist
    human_agent_suggestion_config {
      
      # Feature 1: Summarization (Legacy) with baseline 1.0
      feature_configs {
        suggestion_feature {
          type = "CONVERSATION_SUMMARIZATION"
        }
      }

      # Feature 2: Knowledge Assist & Proactive Suggestions
      feature_configs {
        suggestion_feature {
          type = "KNOWLEDGE_ASSIST"
        }
        
        # Proper block for CX Data Store Agents
        query_config {
          dialogflow_query_source {
            agent = var.data_store_location
          }
        }
        
        # Checkbox: Generative Knowledge assist
        enable_conversation_augmented_query = true
        disable_agent_query_logging = false

        # Checkbox: Proactive knowledge assist
        enable_event_based_suggestion = true
        enable_query_suggestion_when_no_answer = true
      }
    }
  }
}