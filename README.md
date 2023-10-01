# ERC20Token
This project is a implementation of an ERC20 token on the Ethereum blockchain. The purpose of this project is to provide a simple and understandable example of how an ERC20 token can be implemented using Solidity, a programming language for Ethereum smart contracts.

## Description
This project is a basic implementation of an ERC20 token using Solidity, a programming language for Ethereum smart contracts. The contract, named `MyERC20`, includes several state variables for token details and balances, a constructor for initialization, and an `onlyOwner` modifier for function restrictions.

## Getting Started
### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyERC20.sol). Copy and paste the following code into the file:

```
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
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0", and then click on the "Compile MyERC20.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyERC20" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the MyToken function.

## Authors
Marl Shane G. Esteron
