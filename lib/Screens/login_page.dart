import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rabbi_tv/Screens/forgetPassword.dart';
import 'package:rabbi_tv/Screens/home_screen.dart';
import 'package:rabbi_tv/Screens/rabbiAppScreen.dart';
import 'package:rabbi_tv/Screens/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = true;
    //..customAnimation = CustomAnimation();
  }
  TextEditingController _mobile=TextEditingController();
  TextEditingController _passkey=TextEditingController();
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    Size size= MediaQuery.of(context).size;
    var url='https://rabbiapp.000webhostapp.com/login_account.php';
    Future<void> logintoaccount() async {
       EasyLoading.show(status: 'Verifying Credential...');
      var response = await http.post(Uri.parse(url), body: {
        "mobile_no": _mobile.text,
        "pass_key": _passkey.text,
      });
      if (response.body.toString()=='Success'){
        final SharedPreferences preferences =
        await SharedPreferences.getInstance();
        var test=await preferences.getString('userId');
        await preferences.setString('userId', _mobile.text);
        EasyLoading.dismiss();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));

      }
      else if (response.body.toString()=='Error'){
        EasyLoading.showError('Invalid Credential');

      }

    }
    return
      WillPopScope(
        onWillPop: (){
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return Future(() => false);
        },
        child: MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset('assets/images/top1.png', width: size.width,)),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset('assets/images/top2.png', width: size.width,)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/images/bottom1.png', width: size.width,)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/images/bottom2.png', width: size.width,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA),
                              fontSize: 36
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          controller: _mobile,
                          decoration: InputDecoration(

                              labelText: 'MOBILE',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)
                          ),),),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _passkey,
                          obscureText:true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child:
                          InkWell(
                            child: Text('forgot password?', style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w700
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.04,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child:
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          autofocus: false,
                          borderRadius: BorderRadius.circular(80),
                          onTap: () async{
                            if(_mobile.text == '' || _passkey.text == ''){
                              EasyLoading.dismiss();
                              Fluttertoast.showToast(msg: 'Please provide all your details');
                            }
                            else if(_mobile.text.length !=10 ){
                              EasyLoading.dismiss();
                              Fluttertoast.showToast(msg: 'Invalid Mobile Number');
                            }
                            else logintoaccount();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(80),

                            ),
                            child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),),

                          ),
                        ),
                      ),
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,

                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: Text("Don't have an account?  Sign Up", style: TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),),
                        ),
                      ),


                    ],
                  )
                ],
              ),
            ),

          ),

        ),
      );
  }
}
