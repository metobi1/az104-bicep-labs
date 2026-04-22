@description('Resource type prefix used in the name')
@minLength(2)
@maxLength(8)
param prefix string = 'vnet'

@description('Project name used in the resource name')
@minLength(2)
@maxLength(12)
param project string = 'az104'

@description('Environment name')
@allowed([
  'lab'
  'test'
  'dev'
])
param environment string = 'lab'

@description('Instance number')
@minValue(1)
@maxValue(999)
param instance int = 1

@description('Azure region for the virtual network')
param location string = resourceGroup().location

@description('Address prefix for the virtual network')
param vnetAddressPrefix string = '10.0.0.0/16'

var instanceCode = padLeft(string(instance), 3, '0')
var vnetName = '${prefix}-${project}-${environment}-${instanceCode}'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}

resource Subnet 'Microsoft.Network/virtualNetworks/subnets@2025-01-01' = {
  parent: virtualNetwork
  name: 'snet-vm-001'
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}    
