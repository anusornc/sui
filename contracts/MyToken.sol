//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import "hardhat/console.sol";
contract MyToken {
    // Some string type variables to identify the token.
    string public name = "MyToken";
    string public symbol = "DGT";

    uint256 public totalSupply = 1000000;

    address public owner;

    mapping(address => uint256) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    /**
     * Contract initialization.
     */
    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        console.log(
            "Transferring from %s to %s %s tokens",
            msg.sender,
            to,
            amount
        );

        // Transfer the amount.
        balances[msg.sender] -= amount;
        balances[to] += amount;

        // Notify off-chain applications of the transfer.
        emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function getOwner() external view returns (address) {
        return owner;
    }

    function getTotalSupply() external view returns (uint256) {
        console.log("Total supply: ", totalSupply);
        return totalSupply;
    }

    // gettoken from each address
    function getTokenFromAddress(address account) external view returns (uint256) {
        return balances[account];
    }

}
