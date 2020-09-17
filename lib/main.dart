import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicShape(),
    );
  }
}

class DynamicShape extends StatefulWidget {
  @override
  _DynamicShapeState createState() => _DynamicShapeState();
}

class _DynamicShapeState extends State<DynamicShape> {
  double _width = 100.0;
  double _height = 100.0;
  double _topLeft = 20;
  double _topRight = 20;
  double _bottomLeft = 20;
  double _bottomRight = 20;
  Color _shapeColor = Colors.black;
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: InkWell(
        splashColor: _shapeColor,
        onTap: () => _changeShape(),
        child: Center(
          child: AnimatedContainer(
            curve: Curves.linearToEaseOut,
            decoration: BoxDecoration(
              color: _shapeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_topLeft),
                topRight: Radius.circular(_topRight),
                bottomLeft: Radius.circular(_bottomLeft),
                bottomRight: Radius.circular(_bottomRight),
              ),
            ),
            duration: Duration(milliseconds: 250),
            width: _width,
            height: _height,
          ),
        ),
      ),
    );
  }

  void _changeShape() {
    var _random = Random(DateTime.now().millisecondsSinceEpoch);

    _width = _random.nextInt(320).toDouble();
    _height = _random.nextInt(320).toDouble();

    int _maxRadius = 100;
    _topLeft = _random.nextInt(_maxRadius).toDouble();
    _topRight = _random.nextInt(_maxRadius).toDouble();
    _bottomLeft = _random.nextInt(_maxRadius).toDouble();
    _bottomRight = _random.nextInt(_maxRadius).toDouble();
    _shapeColor = Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );

    _backgroundColor = Color.fromARGB(
      255,
      0xFF - _shapeColor.red,
      0xFF - _shapeColor.green,
      0xFF - _shapeColor.blue,
    );

    setState(() {});
  }
}
