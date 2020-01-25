locals {
  project_name      = "Account"
  project_abbr      = "account"
  function_name     = "Account"
  function_abbr     = "account"
  organization_name = "Account"
  organization_abbr = "Account"
  environment       = "prd"
  
  region     = data.aws_region.this.name
  account_id = data.aws_caller_identity.this.account_id
}
