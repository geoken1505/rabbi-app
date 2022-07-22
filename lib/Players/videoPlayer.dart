import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentPlayer extends StatefulWidget {
  const ContentPlayer(this.VideoId,{Key? key}) : super(key: key);
  final String VideoId;
  @override
  State<ContentPlayer> createState() => _ContentPlayerState();
}

class _ContentPlayerState extends State<ContentPlayer> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    _controller.toggleFullScreenMode();
  }
  dispose(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.VideoId,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      forceHD: true,
      controlsVisibleAtStart: true,
      hideThumbnail: false,
      mute: false,

    ),
  );
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: (){
          Navigator.pop(
            context,
          );
          return Future(() => false);

        },
        child: YoutubePlayerBuilder(

            player:
            YoutubePlayer(
              width: MediaQuery.of(context).size.width,
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.grey,
             topActions: <Widget>[
               IconButton(onPressed: (){
                 Navigator.pop(context);
               }, icon: Icon(Icons.arrow_back, color: Colors.white,size: 35,))
             ],
              progressColors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.grey,
                  bufferedColor: Colors.indigo
              ),

            ),builder: (context,player){
              return Scaffold(

                body: player,
              );
        },
        )

      );
  }
}
