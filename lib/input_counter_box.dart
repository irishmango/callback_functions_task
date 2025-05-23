import 'package:flutter/material.dart';

class InputCounterBox extends StatefulWidget {
  final Color color;
  final void Function(String) onChanged;
  final void Function(void Function()) resetReady;

  const InputCounterBox({
    super.key,
    required this.color,
    required this.onChanged,
    required this.resetReady,
  });

  @override
  State<InputCounterBox> createState() => _InputCounterBoxState();
}

class _InputCounterBoxState extends State<InputCounterBox> {
  int _length = 0;
  final _controller = TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _length = 0;
    });
    widget.onChanged(''); 
  }

  @override
  void initState() {
    super.initState();
    widget.resetReady(_reset); 
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  _length = text.length;
                });
                widget.onChanged(text);
              },
              decoration: InputDecoration(
                hintText: 'Text eingeben',
                border: OutlineInputBorder(),
              ),
            ),
            Text('Länge: $_length'),
          ],
        ),
      ),
    );
  }
}
