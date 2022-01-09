resource "azurerm_resource_group" "teapot_demo" {
  name     = "teapot-demo"
  location = "westeurope"
}

resource "azurerm_kubernetes_cluster" "teapot_demo" {
  name                = "teapot-demo"
  location            = azurerm_resource_group.teapot_demo.location
  resource_group_name = azurerm_resource_group.teapot_demo.name
  dns_prefix          = "teapotaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Demo"
  }
}
