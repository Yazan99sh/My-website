import 'package:flutter/material.dart';
class FirstSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var CDevTools = [
      'Android Studio',
      'Intellj',
      'VS Code',
      'NetBeans',
      'Redux',
      'Bloc(soon)'
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Image.asset(
            'images/Home/flutter-seeklogo.com.png',
            color: Color.fromRGBO(30, 136, 229, 1),
            width: 60,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:16),
          child: SelectableText(
            'Cross-platform Developer',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 25),
          child: Container(
            width: 300,
            child: SelectableText(
              ' I like the fastest way to achieve my goals with best look and performance ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:16),
          child: SelectableText(
            'frameworks I work in : ',
            style: TextStyle(
                color: Color.fromRGBO(30, 136, 229, 1),
                fontSize: 14),
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:25),
          child: Container(
            width: 300,
            child: SelectableText(
              'Flutter , Dart , Java , SQLlite',
              style: TextStyle(fontSize: 14),
              textScaleFactor: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SelectableText(
            'Dev Tools : ',
            style: TextStyle(
                color: Color.fromRGBO(30, 136, 229, 1),
                fontSize: 14),
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: CDevTools.length,
            itemBuilder: (_, index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 4.5, top: 4.5),
                  child: SelectableText(
                    '${CDevTools[index]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
