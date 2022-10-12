import 'package:drak_light/core/routing/routes.dart';
import 'package:drak_light/core/view_model/base_view.dart';
import 'package:drak_light/core/view_model/screens/screen_three_view_model.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  ScreenThreeViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ScreenThreeViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Theme Changer'),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.screenOne);
                    },
                    child: const Text("First Page")),
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
