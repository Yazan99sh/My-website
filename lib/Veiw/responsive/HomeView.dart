import 'package:flutter/material.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Pages/MyHomePage.dart';
import 'package:yazan_web/Veiw/UI/Mobile/Pages/MyHomePageMobile.dart';
import 'package:yazan_web/Veiw/UI/Tablet/Pages/MyHomePageTablet.dart';
import 'OrientationLayout.dart';
import 'ScreenTypeLayout.dart';
class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(

      mobile: OrientationLayout(portrait: MyHomePageMobile(),landscape: MyHomePageTablet(),
      ),
      tablet:MyHomePageTablet(),
      desktop:MyHomePage(),
    );
  }
}