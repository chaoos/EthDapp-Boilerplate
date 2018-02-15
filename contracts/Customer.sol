pragma solidity ^0.4.18;

/*
   Contract for every user: 
   independent if you're a driver or passanger 
*/

contract Customer {

/* States:
* 0: unused
* 1: driveWith
* 2: inCar
*/
enum state {unused, driveWith, inCar}

address owner;
address public customerAddress;
address public partnerAddress;
state public currentState;
bool public acc;
bool public ack;
uint public price;
uint public balance;

// -- Constructor --
function Customer() payable public {
    customerAddress = address(this);
    currentState = state.unused;
    price = 5;
    owner = msg.sender;
    balance = 100;
}


// -------------------------
// -- getters and setters --
// -------------------------

function getPrice() view returns (uint p) {
    p = price;
}

function getBalance() view returns (uint p) {
    p = balance;
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
    if (a == state.unused) {
        acc = false;
        ack = false;
    }
    currentState = a;
}


//-------------------------
//---- DRIVER FUNCTION ----
//-------------------------

/*
 * sets the boolean acc to true and saves the passenger's contract hash.
 * If the passenger already accepted, the state of both parties is changed.
 */
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

/*
 * sets the boolean ack to true.
 * If the passenger already confirmed arrival, the state of both parties is changed
 * and the payment process is triggered.
 */
function dAck(bool a) public {
    //require (this.getState() == state.driveWith);
    this.setAck(a);
    Customer pass = Customer(this.getPartnerAddress());

    if (this.getAck() && pass.getAck()) {
        this.setState(state.unused);
        pass.setState(state.unused);
        this.incrementBal();
        pass.decrementBal();
    }
}

//----------------------------
//---- PASSANGER FUNCTION ----
//----------------------------

/*
 * sets the boolean acc to true and saves the driver's contract hash.
 * If the driver already accepted, the state of both parties is changed.
 */
function pAccept(address driver) public {
    require (balance > price);
    Customer driv = Customer(driver);
    driv.setPartnerAddress(getCustomerAddress());
    acc = true;
    if (driv.getAcc()) {
        this.setState(state.inCar);
        driv.setState(state.driveWith);
    }
}

/*
 * passenger acknownledges that they arrived and sets
 * the corresponding boolean. If driver already confirmed arrival,
 * payment is triggered and both are set to initial state.
 */
function pAck(bool a) public {
    //require(this.getState() == state.inCar);
    this.setAck(a);
    Customer driv = Customer(this.getPartnerAddress());
    if (this.getAck() && driv.getAck()) {
        this.setState(state.unused);
        driv.setState(state.unused);
        driv.incrementBal();
        this.decrementBal();        
    }
}

// Payment system
function decrementBal() public {
    balance -= price;
}

function incrementBal() public {
    balance += price;
}
}
