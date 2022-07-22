import 'package:flutter/material.dart';
import 'package:rabbi_tv/Screens/viewAllListing.dart';

import '../Players/videoPlayer.dart';

class TestimoniesListing extends StatefulWidget {
  const TestimoniesListing({Key? key}) : super(key: key);

  @override
  State<TestimoniesListing> createState() => _TestimoniesListingState();
}

class _TestimoniesListingState extends State<TestimoniesListing> {
  List<String> thumbnailImage=[
    'dznzq4Wbo6Y',
    'g-t0Q95l06k',
    '2YKuFS_4LDw',
    'nAAqhHVUb1c',
    'AHciY8KUEk4'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Testimonies', style: TextStyle(color: Colors.white, fontFamily: 'Proxima Nova', fontWeight: FontWeight.w800, fontSize: 18),),
                GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ViewAll('Testimonies')),
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
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: thumbnailImage.length,

                  itemBuilder: (BuildContext context, index){
                    return
                      Container(
                        width: 230,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  ContentPlayer(thumbnailImage[index])),
                                );
                              },
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child:
                                  Image.network("https://i.ytimg.com/vi/"+thumbnailImage[index]+"/mqdefault.jpg",
                                    width: 230,
                                    height: 150,
                                    fit: BoxFit.fill,

                                  ),),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 230,
                              ),
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
