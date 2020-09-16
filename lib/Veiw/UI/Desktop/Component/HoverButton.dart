import 'package:flutter/material.dart';
class HoverButton extends StatefulWidget {
final String text;
final GestureTapCallback onTap;
final double width;
final double height;

HoverButton({Key key,this.text, this.onTap, this.width, this.height}) : super (key:key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool hoverColor =false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width:widget.width,
      height:widget.height,
      decoration: BoxDecoration(
        color: hoverColor
            ? Color.fromRGBO(30, 136, 229, 1)
            : Colors.white,
        borderRadius: BorderRadius.circular(35),
        border: hoverColor == true
            ? null
            : Border.all(color: Color.fromRGBO(30, 136, 229, 1)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap:widget.onTap,
        onHover: (hover) {
          if (hover)
            setState(() {
              hoverColor = true;
            });
          else {
            setState(() {
              hoverColor = false;
            });
          }
        },
        child: Center(
          child: Text(
            '${widget.text}',
            textScaleFactor: 1,
            style: TextStyle(
              color: hoverColor == false
                  ? Color.fromRGBO(30, 136, 229, 1)
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
