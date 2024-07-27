import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/vendingStates/state.dart';

import 'has_money_state.dart';

class IdleState extends State {

  IdleState() {
    print("Currently Vending Machine is in Idle state");
  }

  IdleState.fromMachineState(VendingMachine machine) {
    print("Currently Vending machine is in IdleState");
    machine.setCoinList([]);
  }

  @override
  void chooseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("you can not choose Product in idle state");
  }

  @override
  void clickOnInsertCoinButton(VendingMachine machine) {
    machine.setVendingMachineState(new HasMoneyState());
  }

  @override
  void clickOnStarProductSelectionButton(VendingMachine machine) {
    throw new Exception("first you need to click on insert coin button");
  }

  @override
  Item disPenseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("proeduct can not be dispensed idle state");
  }

  @override
  int getChange(int returnChangeMoney) {
    throw new Exception("you can not get change in idle state");
  }

  @override
  void insertCoin(VendingMachine machine, int coinVal) {
    throw new Exception("you can not insert Coin in idle state");
  }

  @override
  List<Coins> refundFullMoney(VendingMachine machine) {
    throw new Exception("you can not get refunded in idle state");
  }

  @override
  void updateInventory(VendingMachine machine, Item item, int codeNumber) {
    machine.getInventory().addItem(item, codeNumber);
  }
  
}