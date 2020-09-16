import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:yazan_web/ModfiedPackage/flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/HoverButton.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/Logo.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/RecentWork.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/socialmedia.dart';
import 'package:yazan_web/Veiw/UI/Mobile/Component/FirstSection.dart';
import 'package:yazan_web/Veiw/UI/Mobile/Component/SecondSection.dart';
import 'package:yazan_web/Veiw/UI/Mobile/Component/ThirdSection.dart';
import '../../../../main.dart';
import 'dart:js' as js;

class MyHomePageMobile extends StatefulWidget {
  @override
  _MyHomePageMobileState createState() => _MyHomePageMobileState();
}

class _MyHomePageMobileState extends State<MyHomePageMobile> {
  var ContactMeColor = false;
  var DHover = false;
bool  recentHover =false;
  var RecentWork = [
    {
      'name': 'Shekh Express',
      'Poster': 'images/Home/',
      'Description':
          'Shekh Express App is a mini market for sell used products online'
    }
  ];
  var SocialMedias = [
    {'Link': 'syria.yazan19@gmail.com', 'logo': 'images/Home/gmail.png'},
    {'Link': 'https://www.facebook.com/yazan.shekhemhmed/', 'logo': 'images/Home/facebook.png'},
    {'Link': 'https://www.linkedin.com/in/yazan-shekh-mohammad-219b101a3', 'logo': 'images/Home/linkedin.png'},
    {'Link': 'https://www.instagram.com/yazoo1999n/', 'logo': 'images/Home/instagram.png'},
    {'Link': 'https://github.com/Yazan99sh', 'logo': 'images/Home/github.png'},
    {'Link': 'https://twitter.com/shekh_yazan', 'logo': 'images/Home/twitter.png'},
    {'Link': 'https://t.me/YA1999ZAN', 'logo': 'images/Home/telegram.png'}
  ];
  ScrollController controller;
  var itemLength = 1;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 1 && itemLength != 4) {
      setState(() {
        itemLength += 1;
      });
    }
  }

  var pointer;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    //838.2222290039062
    return GestureDetector(
      onTap:(){
        setState(() {
          recentHover = false;
        });
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimationLimiter(
          child: Scrollbar(
            controller: controller,
            child: ListView.builder(
              controller: controller,
              itemCount: w == 1536 ? itemLength : 4,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: 750),
                  delay: Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 200.0,
                    child: FadeInAnimation(
                      child: Item(context, index),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Item(BuildContext context, int index) {
    var w = MediaQuery.of(context).size.width;
    var item = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 750),
          childAnimationBuilder: (widget) => SlideAnimation(
            //horizontalOffset: 50.0,
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: <Widget>[
            Container(
              width: 560,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Logo(),
                        )),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: HoverButton(
                            width: 122,
                            height: 45,
                            text: 'Contact me',
                            onTap: () {
                              Navigator.of(context).pushNamed('/ContactMe');
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(21.76),
              child: SelectableText(
                'Software Engineer, Back-end Developer, Flutter Developer',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textScaleFactor: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(21.76),
              child: SelectableText(
                'I code simple , beautiful and useful application on different platforms',
                style: TextStyle(
                  fontSize: 20,
                ),
                textScaleFactor: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(21.76),
              child: Image.asset(
                'images/Home/YazanAvatar.png',
                width: 125,
              ),
            ),
            Image.asset(
              'images/Home/DevKit.png',
              height: 265,
              color: Color.fromRGBO(30, 136, 229, 1),
            ),
          ],
        ),
      ),
      Stack(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            width: w,
            height: 500,
            color: Color.fromRGBO(30, 136, 229, 1),
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    //verticalOffset: 50.0,
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: SelectableText(
                        "Hello , I'm Yazan . It is my pleasure to met you",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35,right: 8,left: 8,),
                      child: Container(
                        width:MediaQuery.of(context).size.width,
                        child: SelectableText(
                          "A young man with a passion and ambition to make beautiful and useful things and a desire to solve all problems  on his way sticking  to learn more additional things and his love to help other with three years of academic and online learning acquired good skills this is me :)",
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: 17
                              ),
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 400),
            child: Center(
              child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 25),
                          child: FirstSection(),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Color.fromRGBO(30, 136, 229, 0.3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 25),
                          child: SecondSection(),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Color.fromRGBO(30, 136, 229, 0.3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 25),
                          child: ThirdSection(),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 75),
        child: Column(
          children: [
            SelectableText(
              'My Recent Work',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
//                  textScaleFactor: 1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 75, bottom: 75),
              child: Container(
                width:400,
                child: AnimationLimiter(
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: portfolioData.length,
                      itemBuilder: (_, index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(milliseconds: 750),
                            delay: Duration(milliseconds: 500),
                            child: ScaleAnimation(
                                scale: 0.5,
                                child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 400,
                                          height:250,
                                          child: RecentWorkHover(RecentWork:portfolioData[index],RecentHover: recentHover,)),
                                    ))));
                      }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 75),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: 45,
                width: 230,
                decoration: BoxDecoration(
                  color:
                      DHover ? Color.fromRGBO(30, 136, 229, 1) : Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: DHover == true
                      ? null
                      : Border.all(
                          color: Color.fromRGBO(30, 136, 229, 1),
                        ),
                ),
                child: InkWell(
                    borderRadius: BorderRadius.circular(35),
                    onTap: () {
                      js.context.callMethod("open",["https://yazanshmo.000webhostapp.com/YazanWebsite/download.php"]);
                    },
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
                          Icon(
                            Icons.class_,
                            color: DHover
                                ? Colors.white
                                : Color.fromRGBO(30, 136, 229, 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Download My Resume',
                              textScaleFactor: 1,
                              style: TextStyle(
                                color: DHover
                                    ? Colors.white
                                    : Color.fromRGBO(30, 136, 229, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: w,
        height: 566,
        color: Color.fromRGBO(30, 136, 229, 1),
        child: AnimationLimiter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 750),
              delay: Duration(milliseconds: 600),
              childAnimationBuilder: (widget) => SlideAnimation(
                //horizontalOffset: 50.0,
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: <Widget>[
                Image.asset(
                  'images/Home/YLogo2.png',
                  width: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SelectableText(
                    "A million dreams for the world we're gonna make",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    width: 461,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: (15) / (15)),
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (_, index) {
                          return SocialMedia(SocialMedias[index]);
                        }),
                  ),
                ),
                SelectableText(
                  "Created By Me . © 2020 Yazan Shekh Mohammed With Flutter",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'images/Home/flutter2.png',
                      width: 35,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    ];
    return item[index];
  }
}
