library mountain_menu;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcBorder extends CustomPainter {
  final Color color;
  final double? borderWidth;

  ArcBorder({required this.color, this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth ?? 4.0;

    Path path = Path();
    path.moveTo(size.width * .35, size.height);
    path.quadraticBezierTo(size.width * .5, 0, size.width * .65, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
