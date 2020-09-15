import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  SharedPreferences sharedPreferences;
  bool isLoggedIn;
  final _url = 'https://reqres.in/api';
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  Future<bool> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool('loggedIn') ?? false;
    return isLoggedIn;
  }

  Future<void> _authenticate({
    @required Map<String, String> authData,
    String type,
  }) async {
    http.Response response;
    print('auth data : $authData');
    try {
      if (type == 'login') {
        response = await http.post(
          '$_url/login',
          body: jsonEncode(authData),
          headers: headers,
        );
        var responsaBody = json.decode(response.body);
        print(responsaBody);
        if (responsaBody['error'] != null) {
          throw HttpException(
              messge:
                  'please use eve.holt@reqres.in for username. and cityslicka for password for login.');
        }
        sharedPreferences.setBool('loggedIn', true);
      } else {
        response = await http.post('$_url/register',
            body: jsonEncode(authData), headers: headers);
        var responsaBody = json.decode(response.body);
        print(responsaBody);
        if (responsaBody['error'] != null) {
          throw HttpException(
              messge:
                  'please use eve.holt@reqres.in for username. and pistol for password for signup.');
        }
      }
    } catch (err) {
      throw err;
    }
  }

  Future<void> login(Map<String, String> authData) async {
    return await _authenticate(authData: authData, type: 'login');
  }

  Future<void> signup(Map<String, String> authData) async {
    return await _authenticate(authData: authData, type: 'signup');
  }
}
