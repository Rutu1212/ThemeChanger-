import 'package:drak_light/core/routing/routes.dart';
import 'package:drak_light/ui/screens/screen_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/provider/theme_provider.dart';
import 'core/routing/locator/locator.dart';
import 'core/routing/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setLocator();

  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool("darkMode") ?? true;

    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) {
          return ThemeNotifier(darkModeOn ? darkTheme : lightTheme);
        },
        builder: (context, child) {
          return const MyApp();
        },
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      theme: themeNotifier.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const ScreenOne(),
      onGenerateRoute: PageRouter.generateRoutes,
      initialRoute: Routes.screenOne,
    );
  }
}
