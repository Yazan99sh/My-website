import 'package:flutter/material.dart';
import 'package:yazan_web/ModfiedPackage/flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/HoverButton.dart';

class SendMessageSuccessful extends StatefulWidget {
  @override
  _SendMessageSuccessfulState createState() => _SendMessageSuccessfulState();
}

class _SendMessageSuccessfulState extends State<SendMessageSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  delay: Duration(microseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    //horizontalOffset: 50.0,
                    verticalOffset: 75.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:125,bottom: 35),
                      child: Center(child: Image.asset('images/MessageSuc/mail.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Message Received. Thanks!',
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "I'll call you very soon",
                      textScaleFactor: 1,
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child:   HoverButton(width: 135,height: 45,onTap: (){

                        Navigator.pushNamed(context,'/Home');

                      },text:'Back To Home',),
                    )
                  ],
                ),
              )),
        ),
      ));
  }
}
