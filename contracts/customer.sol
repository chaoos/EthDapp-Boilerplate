pragma solidity ^0.4.18;

/*
   Contract for every user: 
   independent if you're a driver or passanger 
*/

contract Customer {

/* States:
* 0: unused
* 1: driveWith
* 3: inCar
*/
enum state {unused, driveWith, inCar}

address owner;
address public customerAddress;
address public partnerAddress;
state public currentState;
bool public acc;
bool public ack;
uint public price;

// -- Constructor --
function Customer() payable public {
    customerAddress = address(this);
    currentState = state.unused;
    price = 0.5 ether;
    owner = msg.sender;
}


// -------------------------
// -- getters and setters --
// -------------------------

function getPrice() view returns (uint p){
    p = price;
}

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


//-------------------------
//---- DRIVER FUNCTION ----
//-------------------------

// driver accepts the tour
function dAccept(address passanger) public {
    //require (this.getState()==state.unused);
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
    //require (this.getState() == state.driveWith);
    this.setAck(a);
    Customer pass = Customer(this.getPartnerAddress());

    if (this.getAck() && pass.getAck()) {
        this.setState(state.unused);
        pass.setState(state.unused);
        //this.getCustomerAddress().transfer(this.getPrice());
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
    //require(this.getState() == state.inCar);
    this.setAck(a);
    Customer driv = Customer(this.getPartnerAddress());
    if (this.getAck() && driv.getAck()) {
        this.setState(state.unused);
        driv.setState(state.unused);
        //driv.getCustomerAddress().transfer(driv.getPrice());
        
    }
}

}