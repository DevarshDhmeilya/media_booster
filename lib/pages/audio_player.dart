import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../provider/audio_provider.dart';

class Ad_Page extends StatefulWidget {
  const Ad_Page({Key? key}) : super(key: key);

  @override
  State<Ad_Page> createState() => _Ad_PageState();
}

class _Ad_PageState extends State<Ad_Page> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdProvider>(context, listen: false).open();
    return Scaffold(
        body: StreamBuilder(
      stream: AdProvider.myPlayer.currentPosition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Duration? data = snapshot.data;
          double max = AdProvider
                  .myPlayer.current.value?.audio.duration.inSeconds
                  .toDouble() ??
              Duration.zero.inSeconds.toDouble();
          print("snapShot: ${snapshot.data}");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                min: 0,
                max: max,
                value: data!.inSeconds.toDouble(),
                onChanged: (value) =>
                    Provider.of<AdProvider>(context, listen: false).seekSong(
                  value.toInt(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () =>
                        Provider.of<AdProvider>(context, listen: false)
                            .playSong(),
                    icon: Icon(CupertinoIcons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () =>
                        Provider.of<AdProvider>(context, listen: false)
                            .pauseSong(),
                    icon: Icon(CupertinoIcons.pause),
                  ),
                  IconButton(
                    onPressed: () =>
                        Provider.of<AdProvider>(context, listen: false)
                            .stopSong(),
                    icon: Icon(CupertinoIcons.stop),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
