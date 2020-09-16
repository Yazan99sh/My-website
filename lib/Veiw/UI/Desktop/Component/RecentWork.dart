import 'package:flutter/material.dart';
import 'dart:js' as js;
class RecentWorkHover extends StatefulWidget {
  final Map RecentWork;
   bool RecentHover;
  @override
  _RecentWorkHoverState createState() => _RecentWorkHoverState();

  RecentWorkHover({Key key,this.RecentWork,this.RecentHover=false}) : super (key:key);
}

class _RecentWorkHoverState extends State<RecentWorkHover> {

  bool DHover = false;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    double font;
    if (w > 950) {
      font=18;
    }
    if (w > 600) {
      font=16;
    }
else {
      font=14;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: !widget.RecentHover ? Colors.transparent : Colors.blue[900],
        borderRadius: BorderRadius.circular(35),
      ),
      child: InkWell(
          onTap: () {
            if (!widget.RecentHover){
              setState(() {
                widget.RecentHover = true ;
              });
            }
          },
          borderRadius: BorderRadius.circular(35),
          onHover: (hover) {
            if (hover) {
              setState(() {
                widget.RecentHover = true;
              });
            } else {
              setState(() {
                widget.RecentHover = false;
              });
            }
          },
          child: widget.RecentHover
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width:338,
                      child: Text(
                        '${widget.RecentWork['description']}',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white, fontSize: font),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height:45,
                      width:131,
                      decoration: BoxDecoration(
                        color: DHover
                            ? Color.fromRGBO(30, 136, 229, 1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(35),
                        border: DHover == true
                            ? null
                            : Border.all(
                                color: Color.fromRGBO(30, 136, 229, 1),
                              ),
                      ),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap:(){
                            js.context.callMethod("open", [widget.RecentWork['link']]);
                          }
                          ,
                          onHover: (hover) {
                            if (hover)
                              setState(() {
                                DHover = true;
                              });
                            else {
                              setState(() {
                                DHover = false;
                              });
                            }
                          },
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'More Details',
                                    textScaleFactor: 1,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                )
              : Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      '${widget.RecentWork['logo'].toString()}',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
    );
  }
}