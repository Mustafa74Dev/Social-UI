import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);

    Offset curvePoint1 = Offset(
      size.width / 2,
      size.height,
    );
    Offset centerPoint = Offset(
      size.width,
      4 * size.height / 5,
    );

    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
