import 'package:drak_light/core/routing/routes.dart';
import 'package:drak_light/ui/screens/screen_one.dart';
import 'package:drak_light/ui/screens/screen_second.dart';
import 'package:drak_light/ui/screens/screen_three.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.screenOne:
        return MaterialPageRoute(builder: (context) => const ScreenOne());
      case Routes.screenSecond:
        return MaterialPageRoute(builder: (context) => const ScreenSecond());
      case Routes.screenThree:
        return MaterialPageRoute(builder: (context) => const ScreenThree());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("Page not found")),
          );
        });
    }
  }
}
