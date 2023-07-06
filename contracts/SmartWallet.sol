// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract MappingStructExample {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping (uint => Transaction) deposits;
        uint numWithdrawals;
        mapping (uint => Transaction) withdrawals;
    }
    mapping (address => Balance) public  balances;

    function getDepositNum(address _from, uint _numDeposits) public view returns (Transaction memory){
        return balances[_from].deposits[_numDeposits];
    }

    function depositMoney() public payable{
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }

    function withDrawMoney(address payable _to, uint _amounts) public {
        balances[msg.sender].totalBalance -= _amounts;
        Transaction memory withdrawal = Transaction( _amounts, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;
        balances[msg.sender].numWithdrawals;
        _to.transfer(_amounts);
    }
}