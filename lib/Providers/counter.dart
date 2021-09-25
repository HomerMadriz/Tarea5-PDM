import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  var colors = {
    "black": Colors.black87,
    "red": Colors.red,
    "blue": Colors.blue,
    "green": Colors.green
  };
  Color _currentColor = (Colors.grey[300] as Color);
  Color _fontColor = Colors.black;
  Color get getFontColor => _fontColor;
  Color get getCurrentColor => _currentColor;
  int get getCount => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    _currentColor = (Colors.grey[300] as Color);
    _fontColor = Colors.black;
    notifyListeners();
  }

  void setColor(String color) {
    _currentColor = (colors[color] as Color);
    _fontColor = Colors.white;
    notifyListeners();
  }
}
