import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:memories/components/HomeScreen.dart';
import 'package:video_player/video_player.dart';

import 'components/EventData.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memories',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Naughty Meghana'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://drive.google.com/uc?export=download&id=1FPmxwfdFIoKR0TEBdD6RLR42x_z_RFtF";


  @override
  void initState() {
    super.initState();
    EventDataService().loadData();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(url),
        ));
  }
  late FlickManager flickManager;

  Widget videoWidget() {
    return FlickVideoPlayer(flickManager: flickManager, wakelockEnabled: false);
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

