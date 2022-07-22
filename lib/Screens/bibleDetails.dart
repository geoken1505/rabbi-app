import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BibleDetails extends StatefulWidget {
  const BibleDetails({Key? key}) : super(key: key);

  @override
  State<BibleDetails> createState() => _BibleDetailsState();
}

class _BibleDetailsState extends State<BibleDetails> {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Container(
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width-50,
                  child:
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        height: 100,
                          width: 100,
                          child: Image.asset('assets/images/bible.png',fit: BoxFit.cover,)
                      ),
                      SizedBox(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bible Basics', textAlign: TextAlign.right,style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          Text('Read and understand \n the basics of Bible', overflow: TextOverflow.visible,textAlign: TextAlign.start,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                        ],
                      )
                    ],
                  ),
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
                SizedBox(height: 30,),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width-50,
                  child:
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        height: 100,
                          width: 100,
                          child: Image.asset('assets/images/poem.png',fit: BoxFit.cover,)
                      ),
                      SizedBox(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bible Authors', textAlign: TextAlign.right,style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          Text('Know the Authors \n for books of Bible', overflow: TextOverflow.visible,textAlign: TextAlign.start,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                        ],
                      )
                    ],
                  ),
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
                SizedBox(height: 30,),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width-50,
                  child:
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/history.png',fit: BoxFit.cover,)
                      ),
                      SizedBox(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('History', textAlign: TextAlign.right,style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          Text('Know the History \n of the Bible', overflow: TextOverflow.visible,textAlign: TextAlign.start,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                        ],
                      )
                    ],
                  ),
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

              ],
            ),
          )

        ],
      ),
    );
  }
}
