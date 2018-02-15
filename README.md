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
