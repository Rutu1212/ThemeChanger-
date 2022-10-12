import 'package:drak_light/core/routing/routes.dart';
import 'package:drak_light/core/view_model/base_view.dart';
import 'package:drak_light/core/view_model/screens/screen_one_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/provider/theme_provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  ScreenOneViewModel? model;
  bool valueTheme = true;

  @override
  Widget build(BuildContext context) {
    Future<void> onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
      (value) ? themeNotifier.setTheme(darkTheme) : themeNotifier.setTheme(lightTheme);
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool('darkMode', value);
    }

    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return BaseView<ScreenOneViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Theme Changer'),
            actions: [
              Row(
                children: [
                  CupertinoSwitch(
                      value: valueTheme,
                      onChanged: (bool? value) {
                        valueTheme = value!;
                        setState(() {});
                        onThemeChanged(value, themeNotifier);
                      })
                ],
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.screenSecond);
                    },
                    child: const Text("Second Page")),
              ],
            ),
          ),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
