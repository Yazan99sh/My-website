import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Logo extends StatelessWidget {
  double width;
  double height;

  Logo({this.width=75.4, this.height=75.4});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      hoverColor: Colors.white,
      borderRadius: BorderRadius.circular(360),
      child: Image.asset(
        'images/Home/YLogo.png',
        width:width,
        height:height,
      ),
      onTap:(){
        Navigator.pushNamed(context,'/Home');
      },
    );
  }
}
