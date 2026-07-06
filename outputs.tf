output "data_protection_backup_policy_blob_storages" {
  description = "All data_protection_backup_policy_blob_storage resources"
  value       = azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages
}
output "data_protection_backup_policy_blob_storages_backup_repeating_time_intervals" {
  description = "List of backup_repeating_time_intervals values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.backup_repeating_time_intervals]
}
output "data_protection_backup_policy_blob_storages_name" {
  description = "List of name values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.name]
}
output "data_protection_backup_policy_blob_storages_operational_default_retention_duration" {
  description = "List of operational_default_retention_duration values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.operational_default_retention_duration]
}
output "data_protection_backup_policy_blob_storages_retention_rule" {
  description = "List of retention_rule values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.retention_rule]
}
output "data_protection_backup_policy_blob_storages_time_zone" {
  description = "List of time_zone values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.time_zone]
}
output "data_protection_backup_policy_blob_storages_vault_default_retention_duration" {
  description = "List of vault_default_retention_duration values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.vault_default_retention_duration]
}
output "data_protection_backup_policy_blob_storages_vault_id" {
  description = "List of vault_id values across all data_protection_backup_policy_blob_storages"
  value       = [for k, v in azurerm_data_protection_backup_policy_blob_storage.data_protection_backup_policy_blob_storages : v.vault_id]
}

