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
`./testrpc --accounts=3 --deterministic --mnemonic="doom and destruction"`

```
./testrpc --deterministic --mnemonic="doom and destruction" --account="<be353e8dc9ae5e8e5e2b79ebfbf1aa030924faa69f8c49c8aac83e99d8f125f1>,100" 
--account="<fa058b06d8bf72c69594e84ed0832398f81140b7b12a97d12e0e7b72c5d457a5>,200"
```
