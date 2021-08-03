// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint256 private value;
  uint public last_completed_migration;

  event ValueChanged(uint256 newValue);

  function set(uint256 _value) public {
        value = _value;
        emit ValueChanged(value);
  }
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
