import 'package:flutter/material.dart';
class SecondSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var BDevTools = [
      'PHPMyAdmin',
      'Firebase',
      'Xammp',
      'Talend API Tester',
      'SQL Developer',
      'SQL server',
      'Restful API'
    ];
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom:16),
          child: Image.asset(
            'images/Home/database.png',
            color: Color.fromRGBO(30, 136, 229, 1),
            width: 60,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:16),
          child: SelectableText(
            'Back-end Developer',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:25),
          child: Container(
            width: 300,
            child: SelectableText(
              ' I like code things simple , reliable , useful and high quality ',
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
            'Languages I speak : ',
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
              'PHP , SQL ,MySQL , Pl/SQL , No SQL , Rest',
              style: TextStyle(fontSize: 14),
              textScaleFactor: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:16),

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
            itemCount: BDevTools.length,
            itemBuilder: (_, index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 4.5, top: 4.5),
                  child: SelectableText(
                    '${BDevTools[index]}',
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
