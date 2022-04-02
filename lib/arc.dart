library mountain_menu;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcContainer extends CustomPainter {
  final Color color;

  ArcContainer({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint();
    // paint.color = Colors.red;
    // paint.style = PaintingStyle.fill;
    //
    // var path = Path();
    //
    // path.moveTo(0, size.height * 0.97);
    // path.quadraticBezierTo(size.width * 0.58, size.height * 0.675,
    //     size.width * 0.55, size.height * 0.8167);
    // path.quadraticBezierTo(size.width * 0.49, size.height * 0.675,
    //     size.width * 1.0, size.height * 1.07);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    //
    // canvas.drawPath(path, paint);
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    Path path = Path();
    path.moveTo(size.width * .35, size.height);
    path.quadraticBezierTo(
        size.width * .5, 0, size.width * .65, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
