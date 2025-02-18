resource "azurerm_application_gateway" "network" {
  name                = "example-appgateway"
  resource_group_name = "example-resourceGroup"
  location            = "example --West-US"

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.example.id
  }

  frontend_port {
    name = "name"
    port = 80
  }
  ####Missing WAF block: As per azure best practices, it is important to have a web application firewall enabled at application gateway.


  frontend_ip_configuration {
    name                 = "${local.resource_prefix.value}-name"
    public_ip_address_id = "Ip-address"
  }

  backend_address_pool {
    name = "${local.resource_prefix.value}-address-pool"
  }

  backend_http_settings {
    name                  = "${local.resource_prefix.value}-http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "${local.resource_prefix.value}-listener_name"
    frontend_ip_configuration_name = "${local.resource_prefix.value}.frontend_ip_configuration_name"
    frontend_port_name             = "${local.resource_prefix.value}.frontend_port_name"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${local.resource_prefix.value}.request_routing_rule_name"
    rule_type                  = "Basic"
    http_listener_name         = "${local.resource_prefix.value}-listener_name"
    backend_address_pool_name  = "${local.resource_prefix.value}.backend_address_pool_name"
    backend_http_settings_name = "${local.resource_prefix.value}.http_setting_name"
  }
  tags = {
    git_commit           = "b07a42ebd74b8f0ba647e20b872474b1c29b4814"
    git_file             = "terraform/azure/application_gateway.tf"
    git_last_modified_at = "2021-05-02 10:08:55"
    git_last_modified_by = "nimrodkor@users.noreply.github.com"
    git_modifiers        = "harkiratbhardwaj/nimrodkor"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "3f62753b-3d20-4fa7-b402-b780234a14d8"
  }
}
