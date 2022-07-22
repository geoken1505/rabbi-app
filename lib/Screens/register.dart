import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _passkey=TextEditingController();
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    Size size= MediaQuery.of(context).size;
    var url='https://rabbiapp.000webhostapp.com/create_account.php';

    Future<void> create_account() async {
      EasyLoading.show(status: 'Creating account...');
      var response = await http.post(Uri.parse(url), body: {
        "mobile_no": _mobile.text,
        "pass_key": _passkey.text,
        "user_name": _name.text,
        "email_id": _email.text,
      });
       if(response.body.toString().contains('Duplicate') ){
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: 'You already have account with us, try resetting your password');
      }
      else if(response.body.toString().contains('Success') ){
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: 'Successfully created your account');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }


    }

    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
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
                      'REGISTER',
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
                      controller: _name,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: 'NAME',
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
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
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
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: _mobile,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
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
                      controller: _passkey,
                      obscureText:true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),),
                  ),
                  SizedBox(
                    height: size.height*0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('By creating account you accept our ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),),
                      Text('Terms ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),),
                      Text('& ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),),
                      Text('Policies', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),),
                    ],
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
                      borderRadius: BorderRadius.circular(80),
                      autofocus: false,
                      radius: 90.0,
                      onTap: () async{
                        if(_mobile.text == '' || _name.text == ''|| _email.text == ''|| _passkey.text == ''){
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(msg: 'Please provide all your details');
                        }
                        else if(_mobile.text.length !=10 ){
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(msg: 'Invalid Mobile Number');
                        }
                        else create_account();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(80),

                        ),
                        child: Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),),

                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),

    ),
      );
  }
}
