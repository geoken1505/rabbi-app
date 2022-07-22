import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rabbi_tv/Screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class MoreMenu extends StatefulWidget {
  const MoreMenu({Key? key}) : super(key: key);

  @override
  State<MoreMenu> createState() => _MoreMenuState();
}

class _MoreMenuState extends State<MoreMenu> {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home:
        Scaffold(
          backgroundColor: Colors.grey[900],
          body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 50,20,20),
                child:
                Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [Container(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/images/logo.png', fit: BoxFit.contain, height: 40, width: 40,),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(3,3),
                                    blurRadius: 15,
                                    spreadRadius: 1
                                ),
                                BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(-1,-1),
                                    blurRadius: 15,
                                    spreadRadius: 1
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[800],
                            ),

                          ),
                            SizedBox(width: 10,),
                            Text('RABBI', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Proxima Nova'),),],
                        ),
                        InkWell(child: Image.asset('assets/images/notification.png', fit: BoxFit.contain, height: 30, width: 30,color: Colors.white,),)
                      ],
                    ),

                  ],
                ),
              ),
              ListTile(
                title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.person),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('Privacy Policy', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: ImageIcon(AssetImage('assets/images/privacy.png')),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('Share App', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.share),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('Rate Us', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.star),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('Our Team', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.group),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('Contact Us', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.contact_mail),
              ),
              Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                onTap: () async {
                  EasyLoading.show(status: 'Logging Out...');
                  EasyLoading.dismiss();
                  final SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.setString('userId', 'no');

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginPage()));
                },
                title: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Proxima Nova'),),
                iconColor: Colors.white,
                leading: Icon(Icons.exit_to_app),
              ),

            ],
          ),
    ),
        ),
      );
  }
}
