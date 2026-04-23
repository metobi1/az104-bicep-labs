
module vnet '../modules/network/vnet.bicep' = {
  name: 'deploy-vnet'
}

module subnet '../modules/network/subnet.bicep' = {
  name: 'deploy-subnet'
  params: {
    vnetName: vnet.outputs.vnetName    
  }
}
