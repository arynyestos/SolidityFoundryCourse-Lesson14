// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Box is Ownable {
    uint256 private s_number;

    // Emitted when the stored value changes
    event NumberChanged(uint256 newValue);

    constructor() Ownable(msg.sender) {}

    // Stores a new value in the contract
    function store(uint256 newValue) public onlyOwner {
        s_number = newValue;
        emit NumberChanged(newValue);
    }

    // Reads the last stored value
    function getNumber() external view returns (uint256) {
        return s_number;
    }
}
