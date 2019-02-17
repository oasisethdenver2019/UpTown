import { Connect, SimpleSigner } from 'uport-connect'

//export let uport = new Connect('TruffleBox')
// export const web3 = uport.getWeb3()


export const uport = new Connect('UpTown', {
     clientId: '2ox3yhAnwM7eahsdNwvovanM1xzRggp9gQi',
     network: 'rinkeby',
     signer: SimpleSigner('c33b126055d33a58a3a6e57790362417e585b8a7865c0ec9a93aa7f936e65442')
   })
export const web3 = uport.getWeb3()



//const ERC223Contract = uport.contract(ABI).at(DEPLOYED_ADDRESS)

// ERC223Contract.balanceOf('0x627306090abaB3A6e1400e9345bC60c78a8BEf57', 'balanceReq')
//uport.onResponse('balanceReq').then(payload => {
//  const balance = payload.res
//  console.log("balance", balance)
// })
