import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/screen/home_screen.dart';
import 'package:pro_work_tree_task/screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Widget>(
          builder: (_) => SplashScreen(),
        );
      case HomeScreen.pageName:
        return MaterialPageRoute<Widget>(
          builder: (_) => HomeScreen(),
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
