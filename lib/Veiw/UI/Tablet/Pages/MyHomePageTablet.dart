import 'package:flutter/material.dart';
import 'package:yazan_web/ModfiedPackage/flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/HoverButton.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/Logo.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/RecentWork.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Component/socialmedia.dart';
import '../../../../main.dart';
import 'dart:js' as js;

class MyHomePageTablet extends StatefulWidget {
  @override
  _MyHomePageTabletState createState() => _MyHomePageTabletState();
}

class _MyHomePageTabletState extends State<MyHomePageTablet> {
  bool recentHover =false;
  var ContactMeColor = false;
  var DHover = false;
  var CDevTools = [
    'Android Studio',
    'Intellj',
    'VS Code',
    'NetBeans',
    'Redux',
    'Bloc(soon)'
  ];
  var BDevTools = [
    'PHPMyAdmin',
    'Firebase',
    'Xammp',
    'Talend API Tester',
    'SQL Developer',
    'SQL server',
    'Restful API'
  ];
  var ODevTools = ['Adobe AI', 'Adobe XD', 'Star UML', 'SWI-Prolog','Git','GitHub','PyCharm'];

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

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    //838.2222290039062
    return GestureDetector(
      onTap: (){
        setState(() {
          recentHover =false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimationLimiter(
          child: Scrollbar(
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
              width: 1536,
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
                            width: 122.88,
                            height: 45,
                            text: 'Contact me',
                            onTap:(){
                              Navigator.of(context).pushNamed('/ContactMe');
                            }
                        ),
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
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                textScaleFactor: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(21.76),
              child: SelectableText(
                'I code simple , beautiful and useful application on different platforms',
                style: TextStyle(
                  fontSize: 28,
                ),
                textScaleFactor: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(21.76),
              child: Image.asset(
                'images/Home/YazanAvatar.png',
                width: 185,
              ),
            ),
            Image.asset(
              'images/Home/DevKit.png',
              height: 350,
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
            height: 603.52,
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
                      padding: EdgeInsets.only(top: 75),
                      child: SelectableText(
                        "Hello , I'm Yazan . It is my pleasure to met you",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textScaleFactor: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 37.72),
                      child: Container(
                        width: 921.6,
                        child: Center(
                          child: SelectableText(
                            "A young man with a passion for curiosity and ambition to make beautiful and useful things and a desire to solve all problems  on his way sticking  to learn more additional things and his love to help other with three years of academic and online learning acquired good skills this is me :)",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            maxLines: 6,
                          ),
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
                  width: 1228.8,
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
                          padding: EdgeInsets.only(top: 38),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                    child: Image.asset(
                                      'images/Home/flutter-seeklogo.com.png',
                                      color: Color.fromRGBO(30, 136, 229, 1),
                                      width: 75,
                                    )),
                              ),
                              Expanded(
                                child: Center(
                                    child: Image.asset(
                                      'images/Home/database.png',
                                      color: Color.fromRGBO(30, 136, 229, 1),
                                      width: 75,
                                    )),
                              ),
                              Expanded(
                                child: Center(
                                    child: Image.asset(
                                      'images/Home/pencil.png',
                                      width: 75,
                                      color: Color.fromRGBO(30, 136, 229, 1),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Cross-platform Developer',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Back-end Developer',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Other Skills',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    child: SelectableText(
                                      ' I like the fastest way to achieve my goals with best look and performance ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    child: SelectableText(
                                      ' I like code things simple , reliable , useful and high quality ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    child: SelectableText(
                                      "I have a lot of knowledge and always work hard to improve my old skills , with add new one's",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'frameworks I work in : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Languages I speak : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Things I know :',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                    height: 100,
                                    width: 300,
                                    child: SelectableText(
                                      'Flutter , Dart , Java , SQLlite',
                                      style: TextStyle(fontSize: 18),
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    height: 100,
                                    width: 300,
                                    child: SelectableText(
                                      'PHP , SQL ,MySQL , Pl/SQL , No SQL , Rest',
                                      style: TextStyle(fontSize: 18),
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    child: SelectableText(
                                      'C++ , Prolog , Html , UI ,UX ,SE , SEO ,Problem Solving ,Control version , Python',
                                      style: TextStyle(fontSize: 18),
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Dev Tools : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Dev Tools : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: SelectableText(
                                    'Dev Tools : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 136, 229, 1),
                                        fontSize: 18),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.5, bottom: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
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
                                              fontSize: 18,
                                            ),
                                            textScaleFactor: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: ListView.builder(
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
                                              fontSize: 18,
                                            ),
                                            textScaleFactor: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: ListView.builder(
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
                                              fontSize: 18,
                                            ),
                                            textScaleFactor: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 380, 0, 0),
            child: Center(
              child: Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(18)),
                width: 1228.8,
                height: 785,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    VerticalDivider(
                      thickness: 0.5,
                      color: Color.fromRGBO(30, 136, 229, 0.3),
                    ),
                    Expanded(child: Container()),
                    VerticalDivider(
                      thickness: 0.5,
                      color: Color.fromRGBO(30, 136, 229, 0.3),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 150),
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
              padding: EdgeInsets.only(top:150,bottom:150 ),
              child: Container(
                width: 1228.8,
                child: AnimationLimiter(
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:4/3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                      ),
                      itemCount: portfolioData.length,
                      itemBuilder: (_, index) {
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: Duration(milliseconds: 750),
                            delay: Duration(milliseconds: 500),
                            columnCount: 1,
                            child: ScaleAnimation(
                                scale: 0.5,
                                child: FadeInAnimation(
                                    child: RecentWorkHover(RecentWork:portfolioData[index],RecentHover: recentHover,))));
                      }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 150),
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SelectableText(
                    "A million dreams for the world we're gonna make",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child:Image.asset(
                      'images/Home/flutter2.png',
                      width: 50,
                      color: Colors.white,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    return item[index];
  }
}
