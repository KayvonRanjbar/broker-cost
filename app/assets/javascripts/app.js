angular
  .module('BrokerApp', [])
  .controller('DataController', DataController);

function DataController() {
  var vm = this;
  vm.minDeposit = 1000;
}