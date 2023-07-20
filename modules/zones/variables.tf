# Zones
variable "zones" {
  description = "List of zone names"
  type        = list(string)
}
variable "cloudflare_account_id" {
  description = "Account ID"
  type        = string
}
