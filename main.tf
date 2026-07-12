resource "azurerm_data_protection_backup_policy_blob_storage" "data_protection_backup_policy_blob_storages" {
  for_each = var.data_protection_backup_policy_blob_storages

  name                                   = each.value.name
  vault_id                               = each.value.vault_id
  backup_repeating_time_intervals        = each.value.backup_repeating_time_intervals
  operational_default_retention_duration = each.value.operational_default_retention_duration
  time_zone                              = each.value.time_zone
  vault_default_retention_duration       = each.value.vault_default_retention_duration

  dynamic "retention_rule" {
    for_each = each.value.retention_rule != null ? each.value.retention_rule : []
    content {
      criteria {
        absolute_criteria      = retention_rule.value.criteria.absolute_criteria
        days_of_month          = retention_rule.value.criteria.days_of_month
        days_of_week           = retention_rule.value.criteria.days_of_week
        months_of_year         = retention_rule.value.criteria.months_of_year
        scheduled_backup_times = retention_rule.value.criteria.scheduled_backup_times
        weeks_of_month         = retention_rule.value.criteria.weeks_of_month
      }
      life_cycle {
        data_store_type = retention_rule.value.life_cycle.data_store_type
        duration        = retention_rule.value.life_cycle.duration
      }
      name     = retention_rule.value.name
      priority = retention_rule.value.priority
    }
  }
}

