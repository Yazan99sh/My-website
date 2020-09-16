import 'package:flutter/material.dart';
import 'package:yazan_web/Veiw/UI/Desktop/Pages/ContactMe.dart';
import 'package:yazan_web/Veiw/UI/Mobile/Pages/ContactMeMobile.dart';
import 'package:yazan_web/Veiw/UI/Tablet/Pages/ContactMeTablet.dart';
import 'OrientationLayout.dart';
import 'ScreenTypeLayout.dart';
class ContactMeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(

      mobile: OrientationLayout(portrait: ContactMeMobile(),landscape: ContactMeTablet(),
      ),
      tablet:ContactMeTablet(),
      desktop:ContactMe(),
    );
  }
}
