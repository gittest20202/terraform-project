output "vpc_id" {
  value = module.vpc_module.vpc_id
}
output "ig_id" {
  value = module.ig_module.ig_id
}
output "pubsub_id" {
  value = module.subnet_module.pubsub_id
}
output "sec_id" {
  value = module.sec_module.secid
}
