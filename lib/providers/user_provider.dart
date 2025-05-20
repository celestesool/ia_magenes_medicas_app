import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? token;

  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }
}