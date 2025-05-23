import 'package:callback_functions/input_counter_box.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          children: [
            InputCounterBox(
              color: Colors.lime, 
                onChanged: (text) {
                debugPrint("Text changed");
              },),
            InputCounterBox(
              color: Colors.cyan,
                onChanged: (text) {
                debugPrint("Text changed");
              },
              ),
            InputCounterBox(
              color: Colors.purpleAccent,
              onChanged: (text) {
                debugPrint("Text changed");
              },
              ),
          ],
        ),
      ),
    );
  }
}
