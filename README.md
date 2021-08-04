![](https://i.imgur.com/GA0LyT3.png)

# Introduction 
What is Truffle ? 


How to create and test contract calls with Truffle

# Migrate 

`npx truffle migrate --network rinkeby`

Steps
# Install npm & VSCode

https://code.visualstudio.com/
https://code.visualstudio.com/docs/


# Create a Proyect
```json=

npm init -y 
```
Creates the package.json file 
```json=
{
  "name": "tt_truffle",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/aadorian/tt_truffle.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/aadorian/tt_truffle/issues"
  },
  "homepage": "https://github.com/aadorian/tt_truffle#readme"
}
```
Lets create a .gitignore file with this line
`node_modules`

# Install Truffle 

```javascript=
npm i --save-dev truffle
```


For deploying contracts also install 
npm i @truffle/hdwallet-provider


# Create a Truffle Proyect
```javascript=
npx truffle init
```

>Note: recomended install upgrades `npm i --save-dev` @openzeppelin/truffle-upgrades
and if issues of security `npm audit fix`


By default truffle creates the Migration.sol file. 
We add a value and get and set methods. 

`/contracts/Migrations.sol`
```solidity=
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

Testing locally the contract 

Lets install the testing framefork
```
npm i --save-dev chai
```
Lets create a Migration.test.js file
```javascript=
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

# Faucet & Explorer
Mnemonic for TEST purposes NEVER SHARE YOUR MNEMONIC PHRASE!!
```
cancel surface pelican unfold concert city cheap blur female dog tragic era
```
> 0xF6F057F7C9B37cB9d615008Cbd009d586b1BDEde


'https://faucet.avax-test.network'
'https://docs.avax.network/build/tutorials/smart-contracts/deploy-a-smart-contract-on-avalanche-using-remix-and-metamask'
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

```javascript=
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
| npx   |  |    |


Previous to deploy 

 Found your account with Faucet tokens using the public key
  ![](https://i.imgur.com/4eVHXFY.png)
  View the transaction in the Explorer
   ![](https://i.imgur.com/1T9IoBW.png) |
  Once the contract is deploy on the network it can be access in the explorer
 
![](https://i.imgur.com/EPRiENL.png) 



# Dependencies




# References

https://www.trufflesuite.com/docs/truffle/overview

https://www.avax.network/

https://docs.avax.network/learn/avalanche-bridge-faq

https://www.avalabs.org/whitepapers


https://code.visualstudio.com/

https://forum.openzeppelin.com/t/openzeppelin-upgrades-step-by-step-tutorial-for-truffle/3579