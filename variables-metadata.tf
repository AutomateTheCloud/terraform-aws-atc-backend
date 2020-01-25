variable "project" {
  description = "Project: Name"
  type        = string
  default     = ""
}

variable "project-abbr" {
  description = "Project: Abbreviation"
  type        = string
  default     = ""
}

variable "function" {
  description = "Function: Name"
  type        = string
  default     = ""
}

variable "function-abbr" {
  description = "Function: Abbreviation"
  type        = string
  default     = ""
}

variable "organizational_unit" {
  description = "Organizational Unit: Name"
  type        = string
  default     = ""
}

variable "organizational_unit-abbr" {
  description = "Organizational Unit: Abbreviation"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = ""
}

variable "stack" {
  description = "Stack"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional Tags for AWS Resources"
  type        = map
  default     = {}
}
