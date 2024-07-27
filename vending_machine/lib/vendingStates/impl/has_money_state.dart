import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/vendingStates/impl/idle_state.dart';
import 'package:vending_machine/vendingStates/impl/selection_state.dart';
import 'package:vending_machine/vendingStates/state.dart';

class HasMoneyState extends State {
  HasMoneyState() {
    print("Currently Vending machine is in HasMoneyState");
  }

  @override
  void chooseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("you need to click on start product selection button first");
  }

  @override
  void clickOnInsertCoinButton(VendingMachine machine) {
    return;
  }

  @override
  void clickOnStarProductSelectionButton(VendingMachine machine) {
    machine.setVendingMachineState(new SelectionState());
  }

  @override
  Item disPenseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("product can not be dispensed in hasMoney state");
  }

  @override
  int getChange(int returnChangeMoney) {
    throw new Exception("you can not get change in hasMoney state");
  }

  @override
  void insertCoin(VendingMachine machine,int coinVal) {
    print("Accepted the coin");
    machine.getCoinList().add(Coins(coinVal));

  }

  @override
  List<Coins> refundFullMoney(VendingMachine machine) {
    print("Returned the full amount back in the Coin Dispense Tray");
    machine.setVendingMachineState(new IdleState.fromMachineState(machine));
    return machine.getCoinList();
  }

  @override
  void updateInventory(VendingMachine machine, Item item, int codeNumber) {
    throw new Exception("you can not update inventory in hasMoney  state");
  }
}
