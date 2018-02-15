pragma solidity ^0.4.18;

/*
   a simple introduction smart contract
   with an example of how to set and get values in Solidity
*/

contract Customer {

/* States:
* 1: unused
* 2: driveAlone
* 3: driveWith
* 4: waiting
* 5: inCar
* 6: delivered
*/
enum state {unused, driveAlone, driveWith, waiting, inCar, delivered}

address public customerAddress;
address public partnerAddress;
state public currentState;
bool public acc;
bool public ack;




function getPartnerAddress() view returns (address a) {
    a = partnerAddress;
}

function setPartnerAddress(address a) public {
    partnerAddress = a;
}

function getCustomerAddress() view returns (address a) {
    a = customerAddress;
}

function setCustomerAddress(address a) public {
    customerAddress = a;
}

function getAcc() view returns (bool a) {
    a = acc;
}

function setAcc(bool a) public {
    acc = a;
}


function getAck() view returns (bool a) {
    a = ack;
}
function setAck(bool a) public {
   ack = a;
}

function getState() view returns (state a) {
    a = currentState;
}
function setState(state a) public {
    currentState = a;
}



function Customer() public {
    customerAddress = msg.sender;
    currentState = state.unused;
}



//-------------------------
//---- DRIVER FUNCTION ----
//-------------------------

// driver accepts the tour
function dAccept(address passanger) public {
    require (this.getState()==state.unused);
    Customer pass = Customer(passanger);
    pass.setPartnerAddress(getCustomerAddress());
    acc = true;
    if (pass.getAcc()) {
        this.setState(state.driveWith);
        pass.setState(state.inCar);
    }
    
}

// driver ack. that they arrived
function dAck(bool a) public {
    require (this.getState() == state.driveWith);
    this.setAck(a);
    Customer pass = Customer(this.getPartnerAddress());

    if (this.getAck() && pass.getAck()) {
        this.setState(state.driveAlone);
        pass.setState(state.delivered);
        
    }
    
   
}

//----------------------------
//---- PASSANGER FUNCTION ----
//----------------------------

//passanger accepts the tour
function pAccept(address driver) public {
   // require ( > msg.value); test if enough ether???
    Customer driv = Customer(driver);
    driv.setPartnerAddress(getCustomerAddress());
    acc = true;
    if (driv.getAcc()) {
        this.setState(state.inCar);
        driv.setState(state.driveWith);
    }
}

// passanger ack. that they arrived
function pAck(bool a) public {
    
    
}

}