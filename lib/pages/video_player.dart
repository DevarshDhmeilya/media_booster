import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/video_provider.dart';

class video_player extends StatefulWidget {
  const video_player({Key? key}) : super(key: key);

  @override
  State<video_player> createState() => _video_playerState();
}

class _video_playerState extends State<video_player> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, provider, child) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Chewie(
                controller: provider.chewieController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
