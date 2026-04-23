param vnetName string

param subnetName string = 'snet-vm-001'
param subnetAddressPrefix string = '10.0.1.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-01-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-01-01' = {
  parent: virtualNetwork
  name: subnetName
  properties: {
    addressPrefix: subnetAddressPrefix
  }
} 
