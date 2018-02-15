# EthDapp-Boilerplate
A minimal, frontend-only decentralized application (Dapp) running on the Ethereum blockchain

### dev workflow
redeploy all smart contracts
```
./testrpc 1> testrpc.log
truffle migrate --reset
python -m SimpleHTTPServer
```
use the same addresses when restarting testrpc
`./testrpc --accounts=3 --deterministic --mnemonic="doom and destruction" 1> testrpc.log &`
resulting in private keys:
```
Available Accounts
==================
(0) 0x425a9fc174c4d5ecbfd6798bd08884f0742a8b3d
(1) 0x285e2ed5c93f237927840070ab4ff6da36999115
(2) 0x0737152f6889103bf923b0d87bac0ee5cae901e4

Private Keys
==================
(0) be353e8dc9ae5e8e5e2b79ebfbf1aa030924faa69f8c49c8aac83e99d8f125f1
(1) fa058b06d8bf72c69594e84ed0832398f81140b7b12a97d12e0e7b72c5d457a5
(2) 7024a6710ce0fa9509ba2f25acec904cce7d8a609cbbc09ef2c4e801af57a750

HD Wallet
==================
Mnemonic:      doom and destruction
Base HD Path:  m/44'/60'/0'/0/{account_index}
```

