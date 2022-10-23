import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSwitchDemo(),
    );
  }
}

class AnimatedSwitchDemo extends StatefulWidget {
  const AnimatedSwitchDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitchDemo> createState() => _AnimatedSwitchDemoState();
}

class _AnimatedSwitchDemoState extends State<AnimatedSwitchDemo> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch & AnimatedContainer',
          style: TextStyle(
            color: selected
                ? Colors.primaries[Random().nextInt(Colors.primaries.length)]
                : Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 10),
              width: 200,
              height: 200,
              color: selected
                  ? Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  : Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            Switch(
                value: selected,
                onChanged: (bool value) {
                  setState(() {
                    selected = !selected;
                  });
                })
          ],
        ),
      ),
    );
  }
}
