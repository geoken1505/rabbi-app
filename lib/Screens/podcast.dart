import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
  ];
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
    Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.8),

        ),
      itemCount: imageList.length,
        itemBuilder: (context, index){
          return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageList[index], height: 150, fit: BoxFit.cover,),
                );
        },
      ),
    ),
        ],
      ),
    );
  }
}
