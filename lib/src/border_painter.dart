import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Color(0xffC4C4C4);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 3.5/4,0.0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width * 3.5/4, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * .5/4, size.height/2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
