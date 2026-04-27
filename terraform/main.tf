resource "google_dialogflow_cx_agent" "agent" {
  project               = var.project_id
  display_name          = var.buyer_agent.agent_display_name
  location              = var.agent_location
  default_language_code = "en"
  time_zone             = "America/Los_Angeles"
  description           = var.buyer_agent.agent_description

  advanced_settings {
    logging_settings {
      enable_stackdriver_logging = true
      enable_interaction_logging = true
    }
  }
}

resource "google_dialogflow_cx_generative_settings" "full_generative_settings" {
  parent       = google_dialogflow_cx_agent.agent.id
  language_code = "en"

  llm_model_settings {
    model = "gemini-2.5-flash"
  }
}

resource "google_dialogflow_cx_tool" "data_store_tool" {
  parent       = google_dialogflow_cx_agent.agent.id
  display_name = var.buyer_agent.tool_display_name
  description  = var.buyer_agent.tool_description
  data_store_spec {
    data_store_connections {
      data_store_type = "UNSTRUCTURED"
      data_store      = data.google_discovery_engine_data_store.my_datastore.name
    }
    fallback_prompt {}
  }
}

data "google_discovery_engine_data_store" "my_datastore" {
  project       = var.project_id
  location      = var.datastore_location
  data_store_id = var.buyer_agent.data_store_id
}

resource "google_dialogflow_cx_playbook" "buyer-playbook" {
  parent       = google_dialogflow_cx_agent.agent.id
  display_name = "Playbook for Buyer"
  goal         = "To get users query answered"
  instruction {
    guidelines = "Guidelines to answer query"
    steps {
      text = "step 1"
      steps = jsonencode([
        {
          "text": "step 1 1"
        },
        {
          "text": "step 1 2",
          "steps": [
            {
              "text": "step 1 2 1"
            },
            {
              "text": "step 1 2 2"
            }
          ]
        },
        {
          "text": "step 1 3"
        }
      ])
    }
    steps {
      text = "step 2"
    }
    steps {
      text = "step 3"
    }
  }

  llm_model_settings {
    model = "gemini-2.5-flash"
    prompt_text = "Return me some great results"
  }

  referenced_tools = [google_dialogflow_cx_tool.data_store_tool.id]
}

data "google_project" "project" {
}

resource "google_dialogflow_cx_agent" "supplier_agent" {
  project               = var.project_id
  display_name          = var.supplier_agent.agent_display_name
  location              = var.agent_location
  default_language_code = "en"
  time_zone             = "America/Los_Angeles"
  description           = var.supplier_agent.agent_description

  advanced_settings {
    logging_settings {
      enable_stackdriver_logging = true
      enable_interaction_logging = true
    }
  }
}

resource "google_dialogflow_cx_generative_settings" "supplier_generative_settings" {
  parent        = google_dialogflow_cx_agent.supplier_agent.id
  language_code = "en"

  llm_model_settings {
    model = "gemini-2.5-flash"
  }
}

resource "google_dialogflow_cx_tool" "supplier_data_store_tool" {
  parent       = google_dialogflow_cx_agent.supplier_agent.id
  display_name = var.supplier_agent.tool_display_name
  description  = var.supplier_agent.tool_description
  data_store_spec {
    data_store_connections {
      data_store_type = "UNSTRUCTURED"
      data_store      = data.google_discovery_engine_data_store.supplier_datastore.name
    }
    fallback_prompt {}
  }
}

data "google_discovery_engine_data_store" "supplier_datastore" {
  project       = var.project_id
  location      = var.datastore_location
  data_store_id = var.supplier_agent.data_store_id
}

resource "google_dialogflow_cx_playbook" "supplier-playbook" {
  parent       = google_dialogflow_cx_agent.supplier_agent.id
  display_name = "Playbook for Supplier"
  goal         = "To get users query answered"
  instruction {
    guidelines = "Guidelines to answer query"
    steps {
      text = "step 1"
      steps = jsonencode([
        {
          "text": "step 1 1"
        },
        {
          "text": "step 1 2",
          "steps": [
            {
              "text": "step 1 2 1"
            },
            {
              "text": "step 1 2 2"
            }
          ]
        },
        {
          "text": "step 1 3"
        }
      ])
    }
    steps {
      text = "step 2"
    }
    steps {
      text = "step 3"
    }
  }

  llm_model_settings {
    model = "gemini-2.5-flash"
    prompt_text = "Return me some great results"
  }

  referenced_tools = [google_dialogflow_cx_tool.supplier_data_store_tool.id]
}
