resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-01-01' = {
  name: 'bare-vnet2'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}
