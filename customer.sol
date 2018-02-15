pragma solidity ^0.4.18;

/*
   a simple introduction smart contract
   with an example of how to set and get values in Solidity
*/

contract Customer {

address public customerAddress;
address public parnterAddress;
mapping (address => uint) public balances;
enum State {unused, driveAlone, driveWith, waiting, inCar, delivered}

function Customer() public{
    customerAddress = msg.sender;
    this.State = unused;
    balances[customerAddress] = 100;
}

function balances(address account) public view returns (uint) {
    return balances[account];
}


//-------------------------
//---- DRIVER FUNCTION ----
//-------------------------

// driver accepts the tour
function dAccept(address passanger) public {
    
}

// driver ack. that they arrived
function dAck(address driver) public {

}

//----------------------------
//---- PASSANGER FUNCTION ----
//----------------------------

//passanger accepts the tour
function pAccept(address driver) public {

}

// passanger ack. that they arrived
function pAck(address driver) public {
    
}

