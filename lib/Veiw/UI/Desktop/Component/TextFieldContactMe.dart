import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class TFContactMe extends StatefulWidget {
  final String Label;
  final double width;
  final controller;
  final bool error;
  final String errorMessage;
  @override
  _TFContactMeState createState() => _TFContactMeState();

  TFContactMe(this.Label,this.width,this.controller,this.error,this.errorMessage);
}

class _TFContactMeState extends State<TFContactMe> {
  Color PrimaryColor = Color.fromRGBO(30, 136, 229, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:widget.width,
      child:TextField(
        controller:widget.controller,
        cursorColor: PrimaryColor,
        decoration: InputDecoration(
          floatingLabelBehavior:FloatingLabelBehavior.always,
          labelText: '${widget.Label}',
          hoverColor:PrimaryColor,
          errorText:widget.error?widget.errorMessage:null,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(width: 1, color: PrimaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(35),
            borderSide:BorderSide(width:1,color:PrimaryColor),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(35),
            borderSide:BorderSide(width:1,color:PrimaryColor.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
