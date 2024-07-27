import 'package:vending_machine/models/item_type.dart';

class Item {
  late ItemType type;
  late int price;

  ItemType getType () {
    return this.type;
  }

  void setType(ItemType type) {
    this.type = type;
  }

  int getPrice() {
    return price;
  }

  void setPrice(int price) {
    this.price = price;
  }
}