// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecurePiggyBank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit zero ETH");
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}
