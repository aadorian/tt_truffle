
<p align="left">
<a href="https://www.avax.network" target="_blank">
<img src="https://i.imgur.com/GA0LyT3.png " width="50" alt="AVA logo">
</a>
</p>

# Table of Contents
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
  * [Truffle](#truffle)
- [Previous Steps](#previous-steps)
  * [Install Node & VSCode](#install-node---vscode)
- [Create a Project](#create-a-project)
- [Install Truffle](#install-truffle)
- [Create a Truffle Project](#create-a-truffle-project)
    + [Testing locally the contract](#testing-locally-the-contract)
  * [Faucet](#faucet---explorer)
- [Compile with Truffle](#compile-with-truffle)
- [Migrate with Truffle (Avax Testnet)](#migrate-with-truffle--avax-testnet-)
- [Secure your code](#secure-your-code)
- [Dependencies](#dependencies)
    + [Video](#video)
    + [Faucet](#faucet)
    + [Tutorial Source Code in Github ](#code-github)
- [References](#references)


# Introduction 
*What is Truffle ?*

[Truffle](https://www.trufflesuite.com/truffle) is the most popular development framework for Ethereum with a mission to make your life a whole lot easier.


In this tutorial we will learn how to create and test contract  with Truffle. We will fist create a project, install truffle and test a contract with truffle commands and finally deploy it to Avalanche blockchain.

*What is Avalanche?*
>[Avalanche ](https://docs.avax.network/)is an open-source platform for launching decentralized applications and enterprise blockchain deployments in one interoperable, highly scalable ecosystem. Avalanche is the first decentralized smart contracts platform built for the scale of global finance, with near-instant transaction finality. Ethereum developers can quickly build on Avalanche as [Solidity](https://docs.soliditylang.org/en/v0.8.6/) works out-of-the-box.
# Previous Steps
## Install Node & VSCode

Before compiling in truffle, we must have the following tools installed.

[Visual Studio Code ](https://code.visualstudio.com/) is a code editor redefined and optimized for building and debugging modern web and cloud applications)


[Node.js](https://nodejs.org/en/download/)  is designed to build scalable network applications.
https://nodejs.org/en/download/

# Create a Project

To initialize a project in node in the console of a terminal we execute the following command
``` json

npm init -y 
```


# Install Truffle 

To install truffle we must follow the instructions of [Truffle URL](https://www.trufflesuite.com/docs/truffle/getting-started/installation)
```
npm i --save-dev truffle
```


For deploying contracts we will also install 
```
npm i @truffle/hdwallet-provider
```


# Create a Truffle Project

Lets create a truffle project: 

``` javascript
npx truffle init
```

>Note: We also recommend install upgrades `npm i --save-dev` @openzeppelin/truffle-upgrades
and if issues of security warnings appear in the terminal, we must execute `npm audit fix`


By default truffle creates the Migration.sol file. 
We add a value and get and set methods. 

``` solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint256 private value; //add a value
  uint public last_completed_migration;

  event ValueChanged(uint256 newValue);
  //set the value  
  function set(uint256 _value) public {
        value = _value;
        emit ValueChanged(value);
  }
  //get the value
  function get() public view returns (uint256) {
       return value;
  }
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
```

### Testing locally the contract 

Lets install the testing framefork (there are several options but this time we will use Chai)
```
npm i --save-dev chai
```
Lets create a Migration.test.js file
``` javascript
const { expect } = require('chai');

const Contract = artifacts.require('Migrations');
 
contract('Migration', function () {
  beforeEach(async function () {
    this.contract = await Contract.new();
  });
 
  it('retrieve returns a value previously stored', async function () {
    let value = 10
    let expected_value = '10' 
    await this.contract.set(value);
    expect((await this.contract.get()).toString()).to.equal(expected_value);
  });
});
```

To test the contract we use 
``` shell
npx truffle test
```

## Faucet & Explorer

In this tutorial we expose the mnemonic phrase only for TEST purposes remember:  NEVER SHARE YOUR MNEMONIC PHRASE!!
```
cancel surface pelican unfold concert city cheap blur female dog tragic era
```
> 0xF6F057F7C9B37cB9d615008Cbd009d586b1BDEde

The following links are important for an account to have funds and to be able to deploy our contract in the blockchain. 



| Description | Reference |
| -------- | -------- | 
|Crypto faucets is an app or a website that distributes small amounts of cryptocurrencies. | https://faucet.avax-test.network     |
| Faucets URL  | [Avax Network](https://docs.avax.network/build/tutorials/smart-contracts/deploy-a-smart-contract-on-avalanche-using-remix-and-metamask)| 





# Compile with Truffle 

``` shell
npx truffle compile
```

# Interacting with the Contract

We can start an instance of ganache (local blockchain) to interact with our contract
`npx truffle develop` 

See the deployed contracts
`npx truffle networks` 




``` javascript
const myContract = await Migrations.deployed();
let accounts = await web3.eth.getAccounts()
const result = await myContract.get();
const tx = await myContract.set(1).send({from: aaccounts[0]});
```



# Migrate with Truffle (Avax Testnet)



``` shell
npx truffle migrate --network avax
```

The contract address of this example is in
0xa5bC2Ca1Ce90657Fc66d694fb8c264e29eAF6F7c
 
 The contract can be query in the Avax Explorer [](https://cchain.explorer.avax-test.network/address/0xa5bC2Ca1Ce90657Fc66d694fb8c264e29eAF6F7c/transactions)


# Secure your code

In order to avoid exposing the mnemonic phrase we use dotenv library. 

```javascript=
npm i dotenv
```
Create a .env file  in the project and import in `truffle-config.js` with 
`require("dotenv").config()`. Also remember to 
access to the mnemonic now in a secure way using 
``` javascript
const MNEMONIC = process.env.MNEMONIC 
```
Also a good practice is to hide it from your Git repo using a `.gitignore` file should look like this

```
node_modules
.env
```

## Advanced features using truffle 

Advanced truffle  options are available online 
https://www.trufflesuite.com/docs/truffle/reference/truffle-commands and also Avalanche blockchain concepts https://docs.avax.network/learn/platform-overview


# Conclusion

Below are the set of commands used in this tutorial and its corresponding snapshot

| Command | Terminal | 
| -------- | -------- | 
| *npx truffle init*    | ![](https://i.imgur.com/HZqjcDx.png) |
| *npx truffle compile*    |  ![](https://i.imgur.com/7zle53o.png)   | 
| *npx truffle help*    | ![](https://i.imgur.com/p3yZJgK.png)  | 
| *npx truffle test*    | ![](https://i.imgur.com/tjNBoSj.png)  | 
| *npx truffle migrate --network avax*   | ![](https://i.imgur.com/3ZNsa5J.png) | |
| *npx truffle networks*   | ![](https://i.imgur.com/QrGXZON.png) | 


# Dependencies

```json=
  "devDependencies": {
    "@openzeppelin/truffle-upgrades": "^1.8.0",
    "chai": "^4.3.4",
    "truffle": "^5.4.3",
    "@truffle/hdwallet-provider": "^1.4.2",
    "dotenv": "^10.0.0"
  }
```


### Video 

An example of the installation and execution process is presented in the following link

https://youtu.be/vAfdoCkg5Pw



### Faucet 

Previous to deploy claim some faucets for the account.

| Concept | Definition | 
| -------- | -------- | 
| Claim faucet |   ![](https://i.imgur.com/4eVHXFY.png)| 
| transaction confirmed | ![](https://i.imgur.com/1T9IoBW.png) | 



### Tutorial Source Code in Github 

```
git clone https://github.com/aadorian/truffle_avalanche.git
```

# References

**Avalanche Docs** https://docs.avax.network/
https://www.avalabs.org/whitepapers
https://www.avax.network/
https://docs.avax.network/learn/avalanche-bridge-faq
 
**Truffle Docs** https://www.trufflesuite.com/docs/truffle/overview

**VS Code**
https://code.visualstudio.com/
https://code.visualstudio.com/docs/

**Avalanche** 
https://github.com/ava-labs
https://docs.avax.network/
https://support.avax.network/en/collections/2353492-blockchain-basics
https://explorer.avax.network

