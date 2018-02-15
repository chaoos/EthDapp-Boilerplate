# EthDapp-Boilerplate
A minimal, frontend-only decentralized application (Dapp) running on the Ethereum blockchain

### dev workflow
redeploy all smart contracts
```
./testrpc 1> testrpc.log
truffle migrate --reset
python -m SimpleHTTPServer
```
