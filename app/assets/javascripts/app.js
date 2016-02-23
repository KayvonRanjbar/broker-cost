angular
  .module('BrokerApp', [])
  .controller('DataController', DataController);

function DataController() {
  var vm = this;
  vm.minDeposit = 1000;
  vm.stockTrades = 0;
  vm.mutualFundTrades = 0;
  vm.optionTrades = 0;
  vm.marginUsed = 0;
  vm.brokers = brokers;
}