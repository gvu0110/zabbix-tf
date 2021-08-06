// Example log line:
// 2021-06-10 16:07:02: 10.50.44.239: 24,10.115.31.28: 1,10.115.31.160: 1,10.115.31.92: 2,totalSize: 28
resource "zabbix_item" "nfmp_trap_buffer" {
  name         = "NFMP Trap Buffer"
  key          = "log[/var/log/zabbix/nfmp-trap-buffer.log,\".*totalSize:.([0-9]+)\",,,skip,\\1,]"
  type         = 7
  value_type   = 3
  data_type    = 0
  delay        = "1m"
  history      = "90d"
  trends       = "365d"
  host_id      = "10254" // toroon63nspnfmp1
}

resource "zabbix_trigger" "nfmp_trap_buffer" {
    description = "Too high NFMP trap buffer"
    expression  = "{toroon63nspnfmp1.int.bell.ca:${zabbix_item.nfmp_trap_buffer.key}.last()}>50000"
    priority    = 4
}