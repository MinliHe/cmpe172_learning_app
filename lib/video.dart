import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video extends StatelessWidget
{
  //Full URL: https://www.youtube.com/watch?v=JTIXGdsM73M
  static String videoID = 'JTIXGdsM73M' ;

  final YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),);

  video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Simple Counting Songs'),
      ),
      body: YoutubePlayer(
        controller: _controller,
          liveUIColor: Colors.amber,
          showVideoProgressIndicator: true,
      )
    );
  }
}
