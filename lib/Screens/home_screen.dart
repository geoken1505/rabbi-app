import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabbi_tv/Screens/bibleDetails.dart';
import 'package:rabbi_tv/Screens/moreMenu.dart';
import 'package:rabbi_tv/Screens/podcast.dart';
import 'package:rabbi_tv/Screens/rabbiAppScreen.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'login_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _screens = [
    RabbiAppScreen(),
    BibleDetails(),
    Podcast(),
    MoreMenu(),
  ];
  int _currentIndex = 0;
  @override

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  void dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
      WillPopScope(

        onWillPop: () async{
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return Future(() => false);
        },
        child: Scaffold(

          backgroundColor: Colors.grey[900],
          bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);

            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            iconSize: 26,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/home.png"),),
                  label:'',
                  backgroundColor: Colors.transparent
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quiz.png"),),
                backgroundColor: Colors.transparent,
                label:'',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/podcast.png"),),
                backgroundColor: Colors.transparent,
                label:'',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/discover.png"),),
                  label:'',
                  backgroundColor: Colors.transparent
              ),
            ],
          ),
          body:_screens[_currentIndex],

        ),
      );
  }
}
