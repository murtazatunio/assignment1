import 'package:flutter/material.dart';

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.9;
    path.lineTo(0, p0);

    final controlPoint1 = Offset(size.width * 0.3, size.height * 0.2);
    final controlPoint2 = Offset(size.width * 0.75, size.height);
    final endPoint = Offset(size.width, size.height * 0.75);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
