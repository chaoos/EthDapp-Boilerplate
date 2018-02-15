$(window).on('load', function() {
    
    var contractAbi = [
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "name": "dAck",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "currentState",
            "outputs": [
                {
                    "name": "",
                    "type": "uint8"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "passanger",
                    "type": "address"
                }
            ],
            "name": "dAccept",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getState",
            "outputs": [
                {
                    "name": "a",
                    "type": "uint8"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getPartnerAddress",
            "outputs": [
                {
                    "name": "a",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "address"
                }
            ],
            "name": "setPartnerAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getCustomerAddress",
            "outputs": [
                {
                    "name": "a",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getAcc",
            "outputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "name": "setAcc",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "uint8"
                }
            ],
            "name": "setState",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "partnerAddress",
            "outputs": [
                {
                    "name": "",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "customerAddress",
            "outputs": [
                {
                    "name": "",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "address"
                }
            ],
            "name": "setCustomerAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "acc",
            "outputs": [
                {
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "name": "pAck",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getPrice",
            "outputs": [
                {
                    "name": "p",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "price",
            "outputs": [
                {
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "driver",
                    "type": "address"
                }
            ],
            "name": "pAccept",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getAck",
            "outputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "a",
                    "type": "bool"
                }
            ],
            "name": "setAck",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "ack",
            "outputs": [
                {
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "payable": true,
            "stateMutability": "payable",
            "type": "constructor"
        }
    ];

    // Checking if Web3 has been injected by the browser (Mist/MetaMask)
    if (typeof web3 !== 'undefined') {
        // Use Mist/MetaMask's provider
        $('#status').text('I has web3!!!');
        window.web3 = new Web3(web3.currentProvider);
    } else {
        var errorMsg = 'I doesn\'t has web3 :( Please open in Google Chrome Browser and install the Metamask extension.';
        $('#status').text(errorMsg);
        console.log(errorMsg);
        return;
    }
    
    $('#my-form').on('submit', function(e) {
        e.preventDefault(); // cancel the actual submit
        var me = $('#pHash').val(); // my conract address
        var you = $('#dHash').val(); // others contract address
        var iam = $('#pHash').val(); // Driver or Passenger

        var contractInstance = web3.eth.contract(contractAbi).at(me);

        if (iam == "Driver") {
            console.log("calling dAccept");
            contractInstance.dAccept(you, function(error, txHash) {
                if (error) {
                    var errorMsg = 'error calling dAccept to smart contract: ' + error;
                    $('#status').text(errorMsg);
                    console.log(errorMsg);
                    return;
                }
                $('#status').text('submitted request to blockchain, transaction hash: ' + txHash);
            });
        } else if (iam == "Passenger") {
            console.log("calling pAccept");
            contractInstance.pAccept(you, function(error, txHash) {
                if (error) {
                    var errorMsg = 'error calling pAccept to smart contract: ' + error;
                    $('#status').text(errorMsg);
                    console.log(errorMsg);
                    return;
                }
                $('#status').text('submitted request to blockchain, transaction hash: ' + txHash);
            });            
        }
    });


    $('#happy-form').on('submit', function(e) {
        e.preventDefault(); // cancel the actual submit
        var me = $('#pHash').val(); // my conract address
        var you = $('#dHash').val(); // others contract address
        var iam = $('#pHash').val(); // Driver or Passenger

        var happy = $('#happy').is(':checked'); // true or false
        var contractInstance = web3.eth.contract(contractAbi).at(me);

        if (iam == "Driver") {
            console.log("calling dAck");
            contractInstance.dAck(happy, function(error, txHash) {
                if (error) {
                    var errorMsg = 'error calling pAccept to smart contract: ' + error;
                    $('#status').text(errorMsg);
                    console.log(errorMsg);
                    return;
                }
                $('#status').text('submitted request to blockchain, transaction hash: ' + txHash);
            });
        } else if (iam == "Passenger") {
            console.log("calling pAck");
            contractInstance.pAck(happy, function(error, txHash) {
                if (error) {
                    var errorMsg = 'error calling pAccept to smart contract: ' + error;
                    $('#status').text(errorMsg);
                    console.log(errorMsg);
                    return;
                }
                $('#status').text('submitted request to blockchain, transaction hash: ' + txHash);
            });
        }
    });

});

function cb(error, response) {
    // callback as helper function for debugging purposes
    console.log('error: ' + error + ', response: ' + response);
}
