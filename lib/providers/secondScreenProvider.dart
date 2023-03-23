import 'package:flutter/foundation.dart';

class SecondScreenProvider with ChangeNotifier{
  List<int> isTapped = [];
void addElement(index){
  isTapped.add(index);
  notifyListeners();
}
void removeElement(index){
  isTapped.remove(index);
  notifyListeners();
}
}