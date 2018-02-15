// var Migrations = artifacts.require("./Migrations.sol");
// var Hello = artifacts.require("./Hello.sol");
var Customer = artifacts.require("./Customer.sol");
var Customer2 = artifacts.require("./Customer.sol");

module.exports = function(deployer) {
  // deployer.deploy(Migrations);
  // deployer.deploy(Hello);
  // deploy two customers
  deployer.deploy(Customer);
  deployer.deploy(Customer2);
};
