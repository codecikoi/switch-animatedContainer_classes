import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => ColorProvider(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[300],
            title: Consumer<ColorProvider>(
              builder: (context, value, child) => Text(
                'With change notifier provider',
                style: TextStyle(color: value.appBarColor),
              ),
            ),
          ),
          body: Center(
            child: Consumer<ColorProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: 150,
                    height: 150,
                    color: value.containerColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Switch(
                    value: value.switchValue,
                    onChanged: (switchValue) => value.changeColor(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorProvider extends ChangeNotifier {
  bool switchValue;
  Color appBarColor;
  Color containerColor;

  ColorProvider()
      : appBarColor = _getRandomColor(),
        containerColor = _getRandomColor(),
        switchValue = false;

  bool changeColor() {
    appBarColor = _getRandomColor();
    containerColor = _getRandomColor();
    switchValue = !switchValue;

    notifyListeners();
    return switchValue;
  }

  static Color _getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
