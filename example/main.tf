provider "aws" {
  alias  = "primary"
  region = "us-east-1"
}

module "backend" {
  source    = "../"
  providers = { aws.this = aws.primary }
  
  project                  = "Account"
  project-abbr             = "account"
  function                 = "Terraform Backend"
  function-abbr            = "terraform_backend"
  organizational_unit      = "Account"
  organizational_unit-abbr = "account"
  environment              = "prd"
  stack                    = "account-terraform_backend-account-prd"
  
  backend-name-prepend     = "terraform4"

  additional_tags          = {
      "Owner"       = "David Singer"
      "Contact"     = "email@address.com"
      "CostCenter"  = "00001",
      "BillingCode" = "a12345"
  }
}
