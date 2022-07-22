import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabbi_tv/Screens/login_page.dart';
import 'package:rabbi_tv/Screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/home_screen.dart';
import 'Screens/rabbiAppScreen.dart';


var myCheck;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  myCheck = (await preferences.getString('userId'))!;
  print(myCheck);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(

      title: 'Rabbi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:  SplashScreen(myCheck),
    );
  }
}

