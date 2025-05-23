import 'package:callback_functions/input_counter_box.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _sumOfLengths = 0;

  int _lengths1 = 0;
  int _lengths2 = 0;
  int _lengths3 = 0;

  late void Function() _resetBox1;
  late void Function() _resetBox2;
  late void Function() _resetBox3;  

  void _updateSum() {
    setState(() {
      _sumOfLengths = _lengths1 + _lengths2 + _lengths3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 80),
        child: Column(
          spacing: 16,
          children: [
            InputCounterBox(
              color: Colors.lime,
              onChanged: (text) {
                _lengths1 = text.length;
                _updateSum();
              },
              resetReady: (resetFn) {
                _resetBox1 = resetFn;
              }
            ),
            InputCounterBox(
              color: Colors.cyan,
              onChanged: (text) {
                _lengths1 = text.length;
                _updateSum();
              },
              resetReady: (resetFn) {
                _resetBox2 = resetFn;
              }
            ),
            InputCounterBox(
              color: Colors.purpleAccent,
              onChanged: (text) {
                _lengths1 = text.length;
                _updateSum();
              },
              resetReady: (resetFn) {
                _resetBox3 = resetFn;
              }
            ),
              Text("Summe aller Längen: $_sumOfLengths"),
              SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  setState(() {
                    _lengths1 = 0;
                    _lengths2 = 0;
                    _lengths3 = 0;
                    _sumOfLengths = 0;
                  });
                  _resetBox1();
                  _resetBox2();
                  _resetBox3();
                },
                child: Text("Reset Counters"),
              ),
          ],
        ),
      ),
    );
  }
}
