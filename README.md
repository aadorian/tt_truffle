
<p align="left">
<a href="https://bruzelle.com" target="_blank">
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
  * [Faucet & Explorer](#faucet---explorer)
- [Compile with Truffle](#compile-with-truffle)
- [Migrate with Truffle (Avax Testnet)](#migrate-with-truffle--avax-testnet-)
- [Secure your code](#secure-your-code)
- [Dependencies](#dependencies)
    + [Video](#video)
    + [Faucet](#faucet)
    + [Code Github](#code-github)
- [References](#references)


# Introduction 

## Truffle 

[Truffle](https://www.trufflesuite.com/truffle) is the most popular development framework for Ethereum with a mission to make your life a whole lot easier.


In this tutorial we will learn how to create and test contract calls with Truffle. Create a project, install truffle and test a contract with Truffle and deploy it to Ava blockchain.

# Previous Steps
## Install Node & VSCode

Before compiling in truffle, we must have the following tools installed.

[Visual Studio Code ](https://code.visualstudio.com/)(Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications)
https://code.visualstudio.com/
https://code.visualstudio.com/docs/

[Node.js](https://nodejs.org/en/download/) (Node.js is designed to build scalable network applications.)
https://nodejs.org/en/download/

# Create a Project

To initialize a project in node in the console of a terminal we execute the following command
```json=

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

``` js
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

``` js
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
```shell=
npx truffle test
```

## Faucet & Explorer

In this tutorial we expose the
Mnemonic only for TEST purposes remember to NEVER SHARE YOUR MNEMONIC PHRASE!!
```
cancel surface pelican unfold concert city cheap blur female dog tragic era
```

```
 0xF6F057F7C9B37cB9d615008Cbd009d586b1BDEde
 ```

The following links are important for an account to have funds and to be able to deploy our contract in the blockchain. 



| Description | Link  | GUI |
| -------- | -------- | -------- |
|Crypto faucets is an app or a website that distributes small amounts of cryptocurrencies. | 'https://faucet.avax-test.network'     | Text     |
| Faucets URL  | [Avax Network](https://docs.avax.network/build/tutorials/smart-contracts/deploy-a-smart-contract-on-avalanche-using-remix-and-metamask)| -------- |
| -------- | -------- | -------- |


'https://cchain.explorer.avax-test.network/'
 The URL for RPC calls is https://api.avax-test.network/ext/bc/C/rpc and the network id is 0xa869


For funding your account use https://faucet.avax-test.network





# Compile with Truffle 

```shell=
npx truffle compile
```

# Migrate with Truffle (Avax Testnet)



```shell=
npx truffle migrate --network avax
```

The contract address of this example is in
0xa5bC2Ca1Ce90657Fc66d694fb8c264e29eAF6F7c
 
 The contract can be query in the Avax Explorer [](https://cchain.explorer.avax-test.network/address/0xa5bC2Ca1Ce90657Fc66d694fb8c264e29eAF6F7c/transactions)


# Secure your code

``` node
npm i dotenv
```

create .env file with 
add the 

require("dotenv").config(); in truffle-config.js

define 
const MNEMONIC = process.env.MNEMONIC

Also hide it from your Git repo. The .gitignore file should look like this

```
node_modules
.env
```


| Command | Terminal | Description |
| -------- | -------- | -------- |
| npx truffle init    | ![](https://i.imgur.com/HZqjcDx.png)     | Text     |
| npx truffle compile    |  ![](https://i.imgur.com/7zle53o.png)   | Text     |
| npx truffle help    | ![](https://i.imgur.com/p3yZJgK.png)  | Text     |
| npx truffle test    | ![](https://i.imgur.com/tjNBoSj.png)  | Text     |
| npx truffle migrate --network avax   | ![](https://i.imgur.com/3ZNsa5J.png) | Text     |




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


### Faucet 

Previous to deploy claim some faucets for the account.

| Concept | Definition | 
| -------- | -------- | 
| Claim faucet |   ![](https://i.imgur.com/4eVHXFY.png)| 
| transaction confirmed | ![](https://i.imgur.com/1T9IoBW.png) | 

### Code Github 

``` git
git clone 
```

# References

https://www.trufflesuite.com/docs/truffle/overview

https://www.avax.network/

https://docs.avax.network/learn/avalanche-bridge-faq

https://www.avalabs.org/whitepapers


https://code.visualstudio.com/

https://forum.openzeppelin.com/t/openzeppelin-upgrades-step-by-step-tutorial-for-truffle/3579
