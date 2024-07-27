import 'dart:core';

import 'package:vending_machine/models/coins.dart';

import '../vendingStates/impl/idle_state.dart';
import '../vendingStates/state.dart';
import 'inventory.dart';

class VendingMachine {
  late State vendingMachineState;
  late Inventory inventory;
  late List<Coins> coinList;

  VendingMachine() {
    vendingMachineState = new IdleState();
    inventory = Inventory(10);
    coinList = [];
  }

  State getVendingMachineState() {
    return vendingMachineState;
  }

  void setVendingMachineState(State vendingMachineState) {
    this.vendingMachineState = vendingMachineState;
  }

  Inventory getInventory() {
    return inventory;
  }

  void setInventory(Inventory inventory) {
    this.inventory = inventory;
  }

  List<Coins> getCoinList() {
    return coinList;
  }

  void setCoinList(List<Coins> coinList) {
    this.coinList = coinList;
  }

}