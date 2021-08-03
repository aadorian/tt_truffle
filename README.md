![](https://i.imgur.com/GA0LyT3.png)

Introduction 
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

`npm i --save-dev truffle`


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



# Compile with Truffle 

```shell=
npx truffle compile
```

| Command | Terminal | Description |
| -------- | -------- | -------- |
| npx truffle init    | ![](https://i.imgur.com/HZqjcDx.png)     | Text     |
| npx truffle compile    |  ![](https://i.imgur.com/7zle53o.png)   | Text     |
| npx truffle help    | ![](https://i.imgur.com/p3yZJgK.png)  | Text     |
| npx truffle test    | ![](https://i.imgur.com/tjNBoSj.png)  | Text     |









# References

https://www.trufflesuite.com/docs/truffle/overview

https://www.avax.network/

https://docs.avax.network/learn/avalanche-bridge-faq

https://code.visualstudio.com/

https://forum.openzeppelin.com/t/openzeppelin-upgrades-step-by-step-tutorial-for-truffle/3579