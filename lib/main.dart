import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/pages/Home_Page.dart';
import 'package:media_booster/provider/audio_provider.dart';
import 'package:media_booster/provider/carsoual_provider.dart';
import 'package:media_booster/provider/video_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => VideoProvider()),
      ChangeNotifierProvider(create: (context) => AdProvider()),
      ChangeNotifierProvider(
        create: (context) => carsoal_slidder(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Provider.of<VideoProvider>(context).open();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Home_Tab_pages(),
    );
  }
}
