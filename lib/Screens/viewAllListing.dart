import 'package:flutter/material.dart';

import '../Players/videoPlayer.dart';

class ViewAll extends StatefulWidget {
  const ViewAll(this.headTitle,{Key? key}) : super(key: key);
final String headTitle;
  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList=[
      'dznzq4Wbo6Y',
      'g-t0Q95l06k',
      '2YKuFS_4LDw',
      'nAAqhHVUb1c',
      'dznzq4Wbo6Y',
      'g-t0Q95l06k',
      '2YKuFS_4LDw',
      'nAAqhHVUb1c',
      'dznzq4Wbo6Y',
      'g-t0Q95l06k',
      '2YKuFS_4LDw',
      'nAAqhHVUb1c',
      'AHciY8KUEk4'
    ];
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 50,0,25),
            child: Text(widget.headTitle, style: TextStyle(color: Colors.white, fontFamily: 'Proxima Nova',
              fontSize: 30, fontWeight: FontWeight.w700,backgroundColor: Colors.transparent,decoration: TextDecoration.none),),
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 26,
                mainAxisSpacing: 26,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 3.6),

              ),
              itemCount: imageList.length,
              itemBuilder: (context, index){
                return
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ContentPlayer(imageList[index])),
                      );
                    },
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network("https://i.ytimg.com/vi/"+imageList[index]+"/mqdefault.jpg", height: 150, fit: BoxFit.cover,),
                ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}