// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubmitEvent {  
  event Submitted(address indexed who, string name);

  mapping(address => string) public names;
  mapping(string => address) public owners;

  function submit(string memory name) external {
    require(owners[name] == address(0), "Transaction id taken");
    address owner = msg.sender;
    owners[name] = owner;
    names[owner] = name;
    emit Submitted(owner, name);
  }
}
