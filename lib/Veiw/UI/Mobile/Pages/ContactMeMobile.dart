import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:yazan_web/ModfiedPackage/flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yazan_web/Service/SendEmail.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/HoverButton.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/Logo.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/TextFieldContactMe.dart';

class ContactMeMobile extends StatefulWidget {
  @override
  _ContactMeMobileState createState() => _ContactMeMobileState();
}

class _ContactMeMobileState extends State<ContactMeMobile> {
  // ignore: non_constant_identifier_names
  Color PrimaryColor = Color.fromRGBO(30, 136, 229, 1);
  // ignore: non_constant_identifier_names
  bool ContactMeColor = false;
  var message = new TextEditingController();
  // ignore: non_constant_identifier_names
  var Name = new TextEditingController();
  // ignore: non_constant_identifier_names
  var Email = new TextEditingController();
  bool msg =false;
  bool eml =false;
  bool nam =false;
  String errorEmail='';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimationLimiter(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 750),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: PrimaryColor.withOpacity(0.3)))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Logo(width: 60,),
                                          )),
                                      Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              width: 123,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.cached,
                                                        color: PrimaryColor,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          message.clear();
                                                          Email.clear();
                                                          Name.clear();
                                                        });
                                                      }),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: PrimaryColor,
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pop(context))
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Center(
                                    child: Image.asset(
                                      'images/Home/YazanAvatar.png',
                                      width: 60,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(35),
                          child: Center(
                            child: Container(
                              width: 1000,
                              child: Text(
                                'Thanks for spending your time to reach me ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[900],
                                ),
                                textScaleFactor: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:25,bottom: 25),
                          child: TFContactMe('Name', 350, Name,nam,'This field can not be empty'),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: 25),
                          child: TFContactMe('Email', 350, Email,eml,errorEmail),
                        ),
                        Container(
                          width: 350,
                          child: TextField(
                            // mouseCursor: MouseCursor.defer,
                            cursorColor: PrimaryColor,
                            maxLines: 6,
                            controller: message,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Message',
                              hoverColor: PrimaryColor,
                              errorText:msg?'This field can not be empty ':null,
                              errorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 1, color:Colors.red),
                              ),
                              focusedErrorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 1, color: PrimaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 1, color: PrimaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    width: 1, color: PrimaryColor.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25,bottom: 25),
                          child:HoverButton(
                            width: 122.88,
                            height: 45,
                            text: 'Submit',
                            onTap: (){
                              check(message.text, Email.text, Name.text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
  void check(String message, String email, String name) async {
    if (message =='' || message == null ){
      setState(() {
        msg = true;
      });
    }
    else {
      setState(() {
        msg=false;
      });
    }
    if (name =='' || name == null ){
      setState(() {
        nam = true;
      });
    }
    else {
      setState(() {
        nam=false;
      });
    }
    if (email =='' || email == null ){
      setState(() {
        eml = true;
        errorEmail = "Email Can't be Empty";
      });
    }
    else {
      if(!email.contains('@')){
        setState(() {
          eml = true;
          errorEmail ='Email must Contain a @ ';
        });
      }
      else {
        setState(() {
          eml =false;
        });
      }
    }
    if (!msg && !nam && !eml){
      bool suc = await SendEmail(message,email,name);
      if (suc){
        Navigator.pushNamed(context,'/SendMessageSuc');
      }
      else {
        Flushbar(
          //title:  "Hey Ninja",
          //message:  "",
          maxWidth: 825,
          flushbarStyle: FlushbarStyle.FLOATING,
          backgroundColor:Colors.red,
          borderRadius:35,
          messageText: Text("Something Went Wrong , Please Try Again",style:TextStyle(
            color: Colors.white,
          ),textScaleFactor: 1,),
          duration:  Duration(seconds: 3),
        )..show(context);
      }
    }
  }
}
