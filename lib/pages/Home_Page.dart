import 'package:flutter/material.dart';
import 'package:media_booster/pages/video_player.dart';
import 'audio_player.dart';
import 'carsoual_slider.dart';

class Home_Tab_pages extends StatefulWidget {
  const Home_Tab_pages({Key? key}) : super(key: key);

  @override
  State<Home_Tab_pages> createState() => _Home_Tab_PagesState();
}

class _Home_Tab_PagesState extends State<Home_Tab_pages>
    with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                "Video",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            Tab(
              child: Text(
                "Slider",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            Tab(
              child: Text(
                "Audio",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          video_player(),
          Carsoual_slider(),
          Ad_Page(),
        ],
      ),
    );
  }
}
