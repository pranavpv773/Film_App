import 'package:film_app/app/core/routes/routes.dart';
import 'package:film_app/app/features/home/view/home_screen.dart';
import 'package:film_app/app/features/home/view_model/home_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashNotifier with ChangeNotifier {
  goToScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    context.read<HomeNotifier>().showsApiFunction();
    Routes.removeScreenUntil(
      screen: const HomeScreen(),
    );
  }
}
