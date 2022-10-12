import 'package:drak_light/core/routing/routes.dart';
import 'package:drak_light/core/view_model/base_view.dart';
import 'package:drak_light/core/view_model/screens/screen_second_view_model.dart';
import 'package:flutter/material.dart';

class ScreenSecond extends StatefulWidget {
  const ScreenSecond({Key? key}) : super(key: key);

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  ScreenSecondViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ScreenSecondViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Theme Changer"),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.screenThree);
                },
                child: const Text('Next Page'),
              ),
            ],
          ),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
