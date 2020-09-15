import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_work_tree_task/screen/home_screen.dart';
import 'package:pro_work_tree_task/widget/loding.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.dark,
      ),
    );
    _navigateToHome(context);
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

  _navigateToHome(
    BuildContext context,
  ) {
    Timer(
      Duration(seconds: 3),
      () async {
        // ignore: unawaited_futures
        Navigator.pushReplacementNamed(context, HomeScreen.pageName);
      },
    );
  }
}
