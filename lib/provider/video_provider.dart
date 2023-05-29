import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController videocontroller;
  late ChewieController chewieController;

  open() {
    videocontroller = VideoPlayerController.network(
        'http://techslides.com/demos/sample-videos/small.mp4')
      ..initialize().then((_) {
        print("url : ${videocontroller.value}");
      })
      ..initialize().then((value) => print("url: ${videocontroller.value}"));
    chewieController = ChewieController(
      videoPlayerController: videocontroller,
      autoPlay: true,
      looping: true,
    );
    notifyListeners();
  }
}
