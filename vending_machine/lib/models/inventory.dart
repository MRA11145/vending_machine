import 'package:vending_machine/models/item.dart';

import 'item_shelf.dart';

class Inventory {
  List<ItemShelf> inventory = [];

  Inventory(int itemCount) {
    this.inventory = List.generate(itemCount, (index) => ItemShelf());
    _initialEmptyInventory();
  }

  List<ItemShelf> getInventory() {
    return this.inventory;
  }

  void _initialEmptyInventory() {
    int startCode = 101;
    for (int i = 0; i < inventory.length; i++) {
      ItemShelf space = ItemShelf();
      space.setCode(startCode);
      space.setSoldOut(true);
      inventory[i] = space;
      startCode++;
    }
  }

  void addItem(Item item, int codeNumber) {
    for (int i = 0; i < inventory.length; i++) {
      if (inventory[i].getCode() == codeNumber) {
        if (inventory[i].getSoldOut()) {
          inventory[i].setItem(item);
          inventory[i].setSoldOut(false);
        } else {
          throw new Exception("already item is present, you can not add item here");
        }
      }
    }
  }

  Item getItem(int codeNumber) {
    for (int i = 0; i < inventory.length; i++) {
      if (inventory[i].getCode() == codeNumber) {
        if (inventory[i].getSoldOut()) {
          throw new Exception("Item already sold out");
        } else {
          return inventory[i].getItem();
        }
      }
    }
    throw new Exception("Invalid Code");
  }

  void updateSoldOutItem(int codeNumber) {
    for (int i = 0; i < inventory.length; i++) {
      if (inventory[i].getCode() == codeNumber) {
        inventory[i].setSoldOut(true);
      }
    }
  }
}
