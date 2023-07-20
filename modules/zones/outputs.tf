# Zones
output "zone_ids" {
  description = "Cloudflare Zone IDs"
  value       = cloudflare_zone.zones[*].id
}


