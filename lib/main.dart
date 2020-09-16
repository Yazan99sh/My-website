import 'package:flutter/material.dart';
import 'package:yazan_web/Veiw/responsive/ContactView.dart';
import 'Service/portfolio.dart';
import 'Service/resume.dart';
import 'Veiw/responsive/HomeView.dart';
import 'Veiw/responsive/SendMessageSuc.dart';
var resumeData;
var portfolioData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  resumeData =await resume();
  portfolioData =await portfolio();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Yazan Shekh Mohammed | Flutter Developer",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily:'Ciro',
        )
      ),
      initialRoute:'/Home',
      routes: {
        '/Home':(context)=>HomeView(),
        '/ContactMe':(context)=>ContactMeView(),
        '/SendMessageSuc':(context)=>SendMessageSucView(),
      },
    );
  }
}

