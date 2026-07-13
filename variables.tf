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
  validation {
    condition = alltrue([
      for k, v in var.data_protection_backup_policy_blob_storages : (
        can(regex("^[-a-zA-Z0-9]{3,150}$", v.name))
      )
    ])
    error_message = "DataProtection BackupPolicy name must be 3 - 150 characters long, contain only letters, numbers and hyphens."
  }
  validation {
    condition = alltrue([
      for k, v in var.data_protection_backup_policy_blob_storages : (
        v.time_zone == null || (length(v.time_zone) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_protection_backup_policy_blob_storages : (
        v.retention_rule == null || alltrue([for item in v.retention_rule : (item.criteria.days_of_month == null || (alltrue([for x in item.criteria.days_of_month : (x >= 0 && x <= 28)])))])
      )
    ])
    error_message = "any of: must be between 0 and 28"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

