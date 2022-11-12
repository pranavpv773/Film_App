import 'package:animate_do/animate_do.dart';
import 'package:film_app/app/features/splash/view_model/splash_otifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashNotifier>(context, listen: false).goToScreen(context);
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Center(
            child: FadeInLeftBig(
          child: Image.asset(
            "assets/logo.png",
            width: 80,
          ),
        )),
      ),
    );
  }
}
