variable "data_protection_backup_policy_blob_storages" {
  description = <<EOT
Map of data_protection_backup_policy_blob_storages, attributes below
Required:
    - name
    - vault_id
Optional:
    - backup_repeating_time_intervals
    - operational_default_retention_duration
    - time_zone
    - vault_default_retention_duration
    - retention_rule (block):
        - criteria (required, block):
            - absolute_criteria (optional)
            - days_of_month (optional)
            - days_of_week (optional)
            - months_of_year (optional)
            - scheduled_backup_times (optional)
            - weeks_of_month (optional)
        - life_cycle (required, block):
            - data_store_type (required)
            - duration (required)
        - name (required)
        - priority (required)
EOT

  type = map(object({
    name                                   = string
    vault_id                               = string
    backup_repeating_time_intervals        = optional(list(string))
    operational_default_retention_duration = optional(string)
    time_zone                              = optional(string)
    vault_default_retention_duration       = optional(string)
    retention_rule = optional(list(object({
      criteria = object({
        absolute_criteria      = optional(string)
        days_of_month          = optional(set(number))
        days_of_week           = optional(set(string))
        months_of_year         = optional(set(string))
        scheduled_backup_times = optional(set(string))
        weeks_of_month         = optional(set(string))
      })
      life_cycle = object({
        data_store_type = string
        duration        = string
      })
      name     = string
      priority = number
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_data_protection_backup_policy_blob_storage's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: can(regex("^[-a-zA-Z0-9]{3,150}$", value))
  #   message:   DataProtection BackupPolicy name must be 3 - 150 characters long, contain only letters, numbers and hyphens.
  # path: vault_id
  #   source:    [from basebackuppolicyresources.ValidateBackupVaultID] !ok
  # path: vault_id
  #   source:    [from basebackuppolicyresources.ValidateBackupVaultID] err != nil
  # path: operational_default_retention_duration
  #   source:    [from helperValidate.ISO8601Duration] !ok
  # path: operational_default_retention_duration
  #   source:    [from helperValidate.ISO8601Duration] err != nil
  # path: time_zone
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: vault_default_retention_duration
  #   source:    [from helperValidate.ISO8601Duration] !ok
  # path: vault_default_retention_duration
  #   source:    [from helperValidate.ISO8601Duration] err != nil
  # path: retention_rule.criteria.absolute_criteria
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: retention_rule.criteria.days_of_month[*]
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: retention_rule.criteria.days_of_week[*]
  #   source:    validation.IsDayOfTheWeek(...) - no translation rule yet, add one
  # path: retention_rule.criteria.months_of_year[*]
  #   source:    validation.IsMonth(...) - no translation rule yet, add one
  # path: retention_rule.criteria.scheduled_backup_times[*]
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: retention_rule.criteria.weeks_of_month[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: retention_rule.life_cycle.data_store_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: retention_rule.life_cycle.duration
  #   source:    [from helperValidate.ISO8601Duration] !ok
  # path: retention_rule.life_cycle.duration
  #   source:    [from helperValidate.ISO8601Duration] err != nil
}

