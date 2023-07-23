import 'package:flutter/material.dart';

class MenuModel extends ChangeNotifier {
  final List _burgerMenu = [
    ["ABQ Hot Chicken", "8.00", "assets/images/abq-sandwich-menu.png"],
    ["Pollos Tenders", "6.00", "assets/images/pollos-tenders-menu.png"],
    ["Slaw Goodman", "5.00", "assets/images/slaw-goodman-menu.png"],
    ["Fring Fries", "3.00", "assets/images/Fring-Fries-menu.png"]
  ];

  final List _beverages = [
    ["Coca Cola", "1.00", "assets/images/cola.jpeg"],
    ["Fanta", "1.00", "assets/images/fanta.jpeg"],
    ["Sprite", "1.00", "assets/images/sprite.jpeg"],
    ["Sweet tea", "0.80", "assets/images/sweet_tea.jpeg"],
    ["Apple Juice", "0.70", "assets/images/apple-juice.jpeg"],
    ["Water", "0.30", "assets/images/water.jpeg"]
  ];

  final List _sauces = [
    ["Mayonnaise", "0.20", "assets/images/mayonniase.jpg"],
    ["Ketchup", "0.20", "assets/images/ketchup.jpg"],
    ["Mustard", "0.20", "assets/images/mustard.jpg"],
    ["Barbeque", "0.20", "assets/images/tangy_barbeque.jpg"],
    ["Ranch", "0.20", "assets/images/creamy_ranch.jpg"],
    ["Buffalo", "0.20", "assets/images/spicy_buffalo.jpg"],
  ];

  get burgerMenu => _burgerMenu;
  get beverages => _beverages;
  get sauces => _sauces;

  List _cartItems = [];
  void add1ToCart(int index) {
    _cartItems.add(_burgerMenu[index]);
    notifyListeners();
  }

  void add2ToCart(int index) {
    _cartItems.add(_beverages[index]);
    notifyListeners();
  }

  void add3ToCart(int index) {
    _cartItems.add(_sauces[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  get cartItems => _cartItems;
}
