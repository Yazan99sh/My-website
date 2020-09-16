import 'package:flutter/material.dart';
class ThirdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var ODevTools = ['Adobe AI', 'Adobe XD', 'Star UML', 'SWI-Prolog','Git','GitHub','PyCharm'];
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom:16),
          child: Image.asset(
            'images/Home/pencil.png',
            width: 60,
            color: Color.fromRGBO(30, 136, 229, 1),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:16),

          child: SelectableText(
            'Other Skills',
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
              "I have a lot of knowledge and always work hard to improve my old skills , with add new one's",
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
            'Things I know :',
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
              'C++ , Prolog , Html , UI ,UX ,SE , SEO ,Problem Solving ,Control version , Python',
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
            itemCount: ODevTools.length,
            itemBuilder: (_, index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 4.5, top: 4.5),
                  child: SelectableText(
                    '${ODevTools[index]}',
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
