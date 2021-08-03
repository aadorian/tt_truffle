// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

 
contract Migrations {
    uint256 private value;
 
    // Emitted when the stored value changes
    event ValueChanged(uint256 newValue);
 
    // Stores a new value in the contract
    function store(uint256 newValue) public {
        value = newValue;
        emit ValueChanged(newValue);
    }
 
    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }
}