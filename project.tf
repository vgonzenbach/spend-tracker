resource "random_id" "hex" {
  byte_length = 2
}

resource "google_project" "spend_tracker" {
    name = "spend-tracker"
    project_id = "spend-tracker-${random_id.hex.hex}"
    # billing_account = "01A-C1A-A1A"
}

