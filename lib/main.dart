import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spacing_animation/pendulum_painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 29, 49),
        appBar: AppBar(
          title: Text('Pendulum Animation'),
        ),
        body: PendulumAnimation(),
      ),
    );
  }
}

class PendulumAnimation extends StatefulWidget {
  @override
  _PendulumAnimationState createState() => _PendulumAnimationState();
}

class _PendulumAnimationState extends State<PendulumAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  double _angle = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: -0.5, end: 0.5).animate(_controller!)
      ..addListener(() {
        setState(() {
          _angle = _animation!.value;
        });
      });
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(150, 300),
        painter: PendulumPainter(_angle),
      ),
    );
  }
}
