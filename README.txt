Smart Wallet


This is a Solidity smart contract that demonstrates the use of mappings and structs in a financial context.

Table of Contents
1. Introduction
2. Usage
3. Structs
4. Functions
5. License

Introduction:-

The MappingStructExample contract allows users to manage their balances and transaction history. It utilizes mappings and structs to store and retrieve data efficiently.

Usage:-

To use this contract, you need to deploy it on the Ethereum network. After deployment, you can interact with the contract by calling its functions.

Structs:-

The contract defines two structs:

Transaction: Represents a financial transaction and consists of the following fields:

amount (uint): The amount of the transaction.
timestamp (uint): The timestamp when the transaction occurred.
Balance: Represents the balance of an account and includes the following fields:

totalBalance (uint): The total balance of the account.
numDeposits (uint): The number of deposits made by the account.
deposits (mapping): Associates a deposit index with a Transaction struct, allowing storage of multiple deposit transactions.
numWithdrawals (uint): The number of withdrawals made by the account.
withdrawals (mapping): Associates a withdrawal index with a Transaction struct, allowing storage of multiple withdrawal transactions.

Functions:- 

The contract provides the following functions:

getDepositNum: Retrieves a specific deposit transaction by its index.

Parameters:
_from (address): The address of the account from which to retrieve the deposit transaction.
_numDeposits (uint): The index of the deposit transaction to retrieve.
Returns:
Transaction: The deposit transaction specified by the index.
depositMoney: Allows an account holder to deposit Ether into their balance.

The function increments the totalBalance of the account by the value (amount) sent with the transaction.
It creates a new Transaction struct for the deposit, including the deposited amount and the current block timestamp.
The deposit transaction is then added to the deposits mapping using the current numDeposits index for the respective account.
Finally, the numDeposits of the account is incremented.
withDrawMoney: Allows an account holder to withdraw Ether from their balance.

Parameters:
_to (address payable): The address to which the funds should be sent.
_amounts (uint): The amount to be withdrawn.
The function subtracts the specified amount from the totalBalance of the account.
It creates a new Transaction struct for the withdrawal, including the withdrawn amount and the current block timestamp.
The withdrawal transaction is then added to the withdrawals mapping using the current numWithdrawals index for the respective account.
The numWithdrawals of the account is incremented.
Finally, the specified amount is transferred to the address specified by _to.

License:-

This project is licensed under the MIT License. You can find the full text of the license in the LICENSE file.