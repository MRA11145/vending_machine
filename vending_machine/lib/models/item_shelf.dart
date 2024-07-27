import 'item.dart';

class ItemShelf {
  late int code;
  late Item item;
  late bool soldOut;

  int getCode() {
    return code;
  }

  void setCode(int code) {
    this.code = code;
  }

  Item getItem() {
    return item;
  }

  void setItem(Item item) {
    this.item = item;
  }

  void setSoldOut(bool soldOut) {
    this.soldOut = soldOut;
  }

  bool getSoldOut() {
    return soldOut;
  }


}