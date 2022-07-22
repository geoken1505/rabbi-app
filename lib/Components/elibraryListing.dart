import 'package:flutter/material.dart';

class ElibraryListing extends StatefulWidget {
  const ElibraryListing({Key? key}) : super(key: key);

  @override
  State<ElibraryListing> createState() => _ElibraryListingState();
}

class _ElibraryListingState extends State<ElibraryListing> {
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
                Text('E Library', style: TextStyle(color: Colors.white, fontFamily: 'Proxima Nova', fontWeight: FontWeight.w800, fontSize: 18),),
                Text('View All', style: TextStyle(color: Colors.blue, fontFamily: 'Proxima Nova', fontWeight: FontWeight.bold, fontSize: 16),),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 0,
            child: Container(
              height: 200,
              child:

              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //itemCount: ImageList.length,
                  itemBuilder: (BuildContext context, data){
                    return
                      Container(

                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.fill,

                                ),),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.fill,

                                ),),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Image.network("https://i.ytimg.com/vi/P9JHQ_eB0X0/mqdefault.jpg",
                                  width: 150,
                                  height: 200,
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
