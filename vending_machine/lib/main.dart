import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';
import 'package:vending_machine/models/item_shelf.dart';
import 'package:vending_machine/models/item_type.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/vendingStates/state.dart';

void main() {
  VendingMachine vendingMachine = VendingMachine();
  try {
    print("|");
    print("Filling up the invetory");
    print("|");

    fillingUpInventory(vendingMachine);
    displayInventory(vendingMachine);

    print("|");
    print("clicking on InsertCoinButton");
    print("|");

    State vendingState = vendingMachine.getVendingMachineState();
    vendingState.clickOnInsertCoinButton(vendingMachine);

    vendingState = vendingMachine.getVendingMachineState();
    vendingState.insertCoin(vendingMachine, 12);
    vendingState.insertCoin(vendingMachine, 13);

    print("|");
    print("clicking on ProductSelectionButton");
    print("|");
    vendingState.clickOnStarProductSelectionButton(vendingMachine);

    vendingState = vendingMachine.getVendingMachineState();
    vendingState.chooseProduct(vendingMachine, 101);



    displayInventory(vendingMachine);
  } catch (e) {
    print("Vending machine issue $e");
  }
}

void fillingUpInventory(VendingMachine vendingMachine) {
  List<ItemShelf> slots = vendingMachine.getInventory().getInventory();
  for (int i = 0; i < slots.length; i++) {
    Item newItem = new Item();
    if (i >= 0 && i < 3) {
      newItem.setType(ItemType.COKE);
      newItem.setPrice(12);
    } else if (i >= 3 && i < 5) {
      newItem.setType(ItemType.PEPSI);
      newItem.setPrice(9);
    } else if (i >= 5 && i < 7) {
      newItem.setType(ItemType.JUICE);
      newItem.setPrice(13);
    } else if (i >= 7 && i < 10) {
      newItem.setType(ItemType.SODA);
      newItem.setPrice(7);
    }
    slots[i].setItem(newItem);
    slots[i].setSoldOut(false);
  }
}

void displayInventory(VendingMachine vendingMachine) {
  List<ItemShelf> slots = vendingMachine.getInventory().getInventory();
  for (int i = 0; i < slots.length; i++) {
    print("Code Number: ${slots[i].getCode()}\n Item: ${slots[i].getItem().getType().name}\n Price: ${slots[i].getItem().getPrice()}\n IsAvailable : ${!slots[i].getSoldOut()}");
  }
}
