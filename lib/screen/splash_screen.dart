import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_work_tree_task/provider/auth_provider.dart';
import 'package:pro_work_tree_task/screen/auth_screen.dart';
import 'package:pro_work_tree_task/screen/home_screen.dart';
import 'package:pro_work_tree_task/widget/loding.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    _navigateToHome(context, _authProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pro Work Tree',
            style: TextStyle(
              color: Colors.black,
              fontSize: 48.0,
              letterSpacing: 2,
            ),
          ),
          Loading()
        ],
      ),
    );
  }

  _navigateToHome(BuildContext context, AuthProvider _authProvider) async {
    var isLoggedIn = await _authProvider.initialize();
    print('logded in : $isLoggedIn');
    Timer(
      Duration(seconds: 3),
      () async {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeScreen.pageName);
        } else {
          Navigator.pushReplacementNamed(context, AuthScreen.pageName);
        }
      },
    );
  }
}
