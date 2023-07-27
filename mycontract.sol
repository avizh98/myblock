// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleTransaction {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transferETH(address payable receiver) external payable {
        require(msg.sender == owner, "Only the contract owner can perform this transaction.");
        require(receiver != address(0), "Invalid receiver address.");
        require(msg.value > 0, "Amount must be greater than 0.");

        // Transfer the specified amount of Ether to the receiver's address
        receiver.transfer(msg.value);
    }

    // Function to check the contract's balance (optional)
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
