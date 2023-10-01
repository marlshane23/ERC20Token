// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    address public owner;
    mapping(address => uint256) balances;

    constructor() {
        name = "MyERC20";
        symbol = "ERC20";
        decimals = 18;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner of this contract can call this function");
        _;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function mint(address to, uint256 amount) public onlyOwner {
        totalSupply += amount;
        balances[to] += amount;
    }

    function burn(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Burn amount exceeds balance");
        totalSupply -= amount;
        balances[msg.sender] -= amount;
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Transfer amount exceeds balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
