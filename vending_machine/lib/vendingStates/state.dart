import 'package:vending_machine/models/coins.dart';
import 'package:vending_machine/models/item.dart';

import '../models/vending_machine.dart';

abstract class State {
  void clickOnInsertCoinButton(VendingMachine machine);
  void clickOnStarProductSelectionButton(VendingMachine machine);
  void insertCoin(VendingMachine machine, int coinVal);
  void chooseProduct(VendingMachine machine, int codeNumber);
  int getChange(int returnChangeMoney);
  Item disPenseProduct(VendingMachine machine, int codeNumber);
  List<Coins> refundFullMoney(VendingMachine machine);
  void updateInventory(VendingMachine machine, Item item, int codeNumber);
}
