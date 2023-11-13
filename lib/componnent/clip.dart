import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Customshape extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     double height = size.height;
//     double width = size.width;
//
//     var path = Path();
//     path.lineTo(0, height-50);
//     path.quadraticBezierTo(width/2, height, width, height-50);
//     path.lineTo(width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
//
// }
class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}