import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/SermonsListing.dart';
import '../Components/bibleSchoolProgram.dart';
import '../Components/carousel.dart';
import '../Components/elibraryListing.dart';
import '../Components/testimoniesListing.dart';
var userId;
class RabbiAppScreen extends StatefulWidget {
  const RabbiAppScreen({Key? key}) : super(key: key);

  @override
  State<RabbiAppScreen> createState() => _RabbiAppScreenState();
}

class _RabbiAppScreenState extends State<RabbiAppScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  Widget build(BuildContext context) {

    return
      Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
        child: Column(
          children: [
            //Logo and top action Section
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Carousel Section
                    CarouselSection(),
                    SizedBox(height: 50,),
                    //BibleSchool Section
                    BibleSchool(),
                    SizedBox(height: 30,),
                    SermonListing(),
                    SizedBox(height: 30,),
                    ElibraryListing(),
                    SizedBox(height: 30,),
                    TestimoniesListing()
                  ],
                ),
              ),
            )
          ],
        ),
    ),
      );
  }
}
