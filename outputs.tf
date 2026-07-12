output "data_protection_backup_policy_blob_storages_id" {
  description = "Map of id values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.id }
}
output "data_protection_backup_policy_blob_storages_backup_repeating_time_intervals" {
  description = "Map of backup_repeating_time_intervals values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.backup_repeating_time_intervals }
}
output "data_protection_backup_policy_blob_storages_name" {
  description = "Map of name values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.name }
}
output "data_protection_backup_policy_blob_storages_operational_default_retention_duration" {
  description = "Map of operational_default_retention_duration values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.operational_default_retention_duration }
}
output "data_protection_backup_policy_blob_storages_retention_rule" {
  description = "Map of retention_rule values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.retention_rule }
}
output "data_protection_backup_policy_blob_storages_time_zone" {
  description = "Map of time_zone values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.time_zone }
}
output "data_protection_backup_policy_blob_storages_vault_default_retention_duration" {
  description = "Map of vault_default_retention_duration values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.vault_default_retention_duration }
}
output "data_protection_backup_policy_blob_storages_vault_id" {
  description = "Map of vault_id values across all data_protection_backup_policy_blob_storages, keyed the same as var.data_protection_backup_policy_blob_storages"
  value       = { for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : k => v.vault_id }
}

