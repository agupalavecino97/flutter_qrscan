import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectdMenuopt = 0;

  int get selectdMenuopt {
    return _selectdMenuopt;
  }

  set selectdMenuopt(int i) {
    _selectdMenuopt = i;
    notifyListeners();
  }
}
