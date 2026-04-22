@description('Resource type prefix used in the name')
param prefix string = 'vnet'

@description('Project name used in the resource name')
param project string = 'az104'

@description('Environment name')
@allowed([
  'lab'
  'test'
  'dev'
])
param environment string = 'lab'

@description('Instance number')
param instance string = '001'

@description('Azure region for the virtual network')
param location string = resourceGroup().location

@description('Address prefix for the virtual network')
param vnetAddressPrefix string = '10.0.0.0/16'

var vnetName = '${prefix}-${project}-${environment}-${instance}'

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
