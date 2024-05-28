import 'dart:math';

import 'package:flutter/material.dart';

class PendulumPainter extends CustomPainter {
  final double angle;

  PendulumPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 4;

    final Paint circlePaint = Paint()..color = Colors.blue;
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final double radius = size.width / 2;

    // Draw the pendulum arm
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(centerX + sin(angle) * radius, centerY + cos(angle) * radius),
      linePaint,
    );

    // Draw the bob (pendulum weight)
    canvas.drawCircle(
      Offset(centerX + sin(angle) * radius, centerY + cos(angle) * radius),
      10,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(PendulumPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}
