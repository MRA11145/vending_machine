import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/vendingStates/impl/dispense_state.dart';
import 'package:vending_machine/vendingStates/state.dart';

import 'idle_state.dart';

class SelectionState extends State {

  SelectionState() {
    print("Currently Vending machine is in Selection State");
  }

  @override
  void chooseProduct(VendingMachine machine, int codeNumber) {
        //1. get item of this codeNumber
        Item item = machine.getInventory().getItem(codeNumber);

        //2. total amount paid by User
        int paidByUser = 0;
        machine.getCoinList().forEach((element) {
          paidByUser += element.value;
        });

        //3. compare product price and amount paid by user
        if(paidByUser < item.getPrice()) {
            print("Insufficient Amount, Product you selected is for price " + "${item.getPrice()}" + " and you paid: " + "$paidByUser");
            refundFullMoney(machine);
            throw new Exception("insufficient amount");
        }
        else if(paidByUser >= item.getPrice()) {

            if(paidByUser > item.getPrice()) {
                getChange(paidByUser-item.getPrice());
            }
            machine.setVendingMachineState(new DispenseState(machine, codeNumber));
        }

  }

  @override
  void clickOnInsertCoinButton(VendingMachine machine) {
    throw new Exception("you can not click on insert coin button in Selection state");
  }

  @override
  void clickOnStarProductSelectionButton(VendingMachine machine) {
    return;
  }

  @override
  Item disPenseProduct(VendingMachine machine, int codeNumber) {
    throw new Exception("product can not be dispensed Selection state");
  }

  @override
  int getChange(int returnChangeMoney) {
    //actual logic should be to return COINs in the dispense tray, but for simplicity i am just returning the amount to be refunded
    print("Returned the change in the Coin Dispense Tray: " + "$returnChangeMoney");
    return returnChangeMoney;
  }

  @override
  void insertCoin(VendingMachine machine, int coinVal) {
    throw new Exception("you can not insert Coin in selection state");
  }

  @override
  List<Coins> refundFullMoney(VendingMachine machine) {
    print("Returned the full amount back in the Coin Dispense Tray");
    machine.setVendingMachineState(new IdleState.fromMachineState(machine));
    return machine.getCoinList();

  }

  @override
  void updateInventory(VendingMachine machine, Item item, int codeNumber) {
    throw new Exception("you can not Update Inventory in selection state");
  }
  
}