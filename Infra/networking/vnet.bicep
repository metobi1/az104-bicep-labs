@allowed([
  'lab'
  'test'
  'dev'
])
param environment string = 'lab'

@allowed([
  '001'
  '002'
  '003'
  '004'
])
param instance string = '001'

var prefix = 'vnet'
var project = 'az104'
var vnetName = '${prefix}-${project}-${environment}-${instance}'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-01-01' = {
  name: vnetName
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}
