// SPDX-License-Identifier: MIT 

contract ExpenseManagerContract {
    address public owner;
    struct Transaction {
        address user;
        uint amount;
        string reason;
        uint timestamp;
    }

    constructor(){
        owner = msg.sender;
    }

    
}
