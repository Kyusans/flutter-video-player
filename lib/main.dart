import 'package:flutter/material.dart';
import 'package:flutter_video/video_player_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void handleNavigateToVideo(videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerWidget(videoUrl: videoUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video mo to"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                handleNavigateToVideo("assets/kys.mp4");
              },
              child: const Text("Play first video"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 16,
            ),
            MaterialButton(
              onPressed: () {
                handleNavigateToVideo("assets/video2.mp4");
              },
              child: const Text("Play second video"),
              color: Colors.black,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
