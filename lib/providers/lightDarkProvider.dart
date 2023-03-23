import 'package:flutter/foundation.dart';

class LightDarkProvider with ChangeNotifier{
  double _currentValue = 0;

  double get currentValue => _currentValue;

  void changed(value){
    _currentValue = value;
    notifyListeners();
  }

}