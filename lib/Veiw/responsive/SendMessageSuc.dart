import 'package:flutter/material.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Pages/MyHomePage.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Pages/SendMessageSuc.dart';
import 'package:yazan_web/Veiw/UI/Tablet/Pages/MyHomePageTablet.dart';
import 'OrientationLayout.dart';
import 'ScreenTypeLayout.dart';

class SendMessageSucView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(

      mobile: OrientationLayout(portrait: SendMessageSuccessful(),landscape: SendMessageSucView(),
      ),
      tablet:SendMessageSuccessful(),
      desktop:SendMessageSuccessful(),
    );
  }
}
