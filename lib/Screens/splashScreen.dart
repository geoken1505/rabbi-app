import 'package:flutter/material.dart';
import 'package:rabbi_tv/Screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(this.Validity,{Key? key}) : super(key: key);
final String Validity;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.Validity);
    var  data=widget.Validity;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: data == 'no' ? 'Login' : 'Home',
        routes: {
          'Login': (context) =>
              LoginPage(
              ),
          'Home': (context) => HomePage()
        }
    );
  }
}
