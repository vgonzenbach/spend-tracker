

module "project-factory" {
  source = "terraform-google-modules/project-factory/google"
  version = "~> 18.0"

  name = "spend-tracker"
  random_project_id = true
  billing_account = var.billing_account

  activate_apis = [
    "workflows.googleapis.com"
  ]

  create_project_sa = false
}