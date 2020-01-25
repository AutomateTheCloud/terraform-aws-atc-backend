locals {
  required_tags = merge(
    map(
      "Project",            var.project,
      "Function",           var.function,
      "OrganizationalUnit", var.organizational_unit,
      "Environment",        var.environment,
      "Stack",              var.stack,
    ),
    var.additional_tags
  )
}
