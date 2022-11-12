import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static nextScreen({required var screen}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static backScreen() {
    navigatorKey.currentState?.pop();
  }
}
