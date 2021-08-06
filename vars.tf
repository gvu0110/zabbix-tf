variable "user" {
  description = "Zabbix login user"
  type = string
}

variable "password" {
  description = "Zabbix login password"
  type = string
}

variable "server_url" {
  description = "Zabbix server URL in the format of <SERVER_URL>/zabbix/api_jsonrpc.php"
  type = string
}