import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/vendingStates/impl/idle_state.dart';
import 'package:vending_machine/vendingStates/state.dart';

class DispenseState extends State {

  DispenseState(VendingMachine machine, int codeNumber) {
    print("Currently Vending machine is in Dispense State");
    disPenseProduct(machine, codeNumber);
  }

  @override
  void chooseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("product can not be choosen in Dispense state");
  }

  @override
  void clickOnInsertCoinButton(VendingMachine machine) {
    throw new Exception("insert coin button can not clicked on Dispense state");
  }

  @override
  void clickOnStarProductSelectionButton(VendingMachine machine) {
    throw new Exception("product selection buttion can not be clicked in Dispense state");
  }

  @override
  Item disPenseProduct(VendingMachine machine, int codeNumber) {
    print("Product has been dispensed");
    Item item = machine.getInventory().getItem(codeNumber);
    machine.getInventory().updateSoldOutItem(codeNumber);
    machine.setVendingMachineState(new IdleState());
    return item;
  }

  @override
  int getChange(int returnChangeMoney) {
    throw new Exception("change can not returned in Dispense state");
  }

  @override
  void insertCoin(VendingMachine machine, int coinVal) {
    throw new Exception("coin can not be inserted in Dispense state");
  }

  @override
  List<Coins> refundFullMoney(VendingMachine machine) {
    throw new Exception("refund can not be happen in Dispense state");
  }

  @override
  void updateInventory(VendingMachine machine, Item item, int codeNumber) {
    throw new Exception("inventory can not be updated in Dispense state");
  }
  
}