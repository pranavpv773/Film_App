import 'package:film_app/app/core/routes/routes.dart';
import 'package:film_app/app/features/cast/view_model/cast_notifier.dart';
import 'package:film_app/app/features/home/view_model/home_notifier.dart';
import 'package:film_app/app/features/splash/view/splash.dart';
import 'package:film_app/app/features/splash/view_model/splash_otifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => HomeNotifier()),
        ChangeNotifierProvider(create: (create) => CastNotifier()),
        ChangeNotifierProvider(create: (create) => SplashNotifier()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: Routes.navigatorKey,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen(),
            );
          }),
    );
  }
}
