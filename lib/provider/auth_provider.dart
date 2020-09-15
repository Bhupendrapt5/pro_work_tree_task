import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  SharedPreferences sharedPreferences;
  bool isLoggedIn;

  Future<bool> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool('loggedIn') ?? false;
    return isLoggedIn;
  }
}
