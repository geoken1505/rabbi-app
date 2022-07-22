import 'package:flutter/material.dart';

import '../Players/videoPlayer.dart';
import '../Screens/viewAllListing.dart';

class BibleSchool extends StatefulWidget {
  const BibleSchool({Key? key}) : super(key: key);

  @override
  State<BibleSchool> createState() => _BibleSchoolState();
}

class _BibleSchoolState extends State<BibleSchool> {

  @override
  Widget build(BuildContext context) {
    List ImageList =[
      'https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg',
      'https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg',
      'https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg',
    ];
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bible School', style: TextStyle(color: Colors.white, fontFamily: 'Proxima Nova', fontWeight: FontWeight.w800, fontSize: 18),),
                GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ViewAll('Bible School')),
                  );
                },
                    child: Text('View All', style: TextStyle(color: Colors.blue, fontFamily: 'Proxima Nova', fontWeight: FontWeight.bold, fontSize: 16),)),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 0,
            child: Container(
              height: 150,
              child:

                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ImageList.length,
                      itemBuilder: (BuildContext context, data){
                      return
                        Container(

                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ContentPlayer('fx8ZTaVuvpM')),
                        );
                        },
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child:
                                  Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                    width: 230,
                                    height: 150,
                                    fit: BoxFit.fill,

                                  ),),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                  width: 230,
                                  height: 150,
                                  fit: BoxFit.fill,

                                ),),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                  width: 230,
                                  height: 150,
                                  fit: BoxFit.fill,

                                ),),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            ),


                          ],
                      ),
                        );
                      }),

            ),
          ),

        ],
      ),
    );
  }
}

class BibleSchoolContent{
  String? imageContent;

}