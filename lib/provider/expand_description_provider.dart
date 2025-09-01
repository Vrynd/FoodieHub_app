import 'package:flutter/material.dart';

class ExpandDescriptionProvider extends ChangeNotifier{
  bool _isExpand = false;
  bool get isExpand => _isExpand;

  void toggleExpand(){
    _isExpand = !_isExpand;
    notifyListeners();
  }
}