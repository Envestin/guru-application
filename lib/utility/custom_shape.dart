import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

   path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo( size.width / 600, size.height*5 , size.width, size.height);
     path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}