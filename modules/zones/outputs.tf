# Zones
output "zone_ids" {
  description = "Cloudflare Zone IDs"
  value       = { for key, zone in cloudflare_zone.zones : key => zone.id }
}



