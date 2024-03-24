import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      widget.videoUrl,
    );
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SizedBox(
                height: 300,
                width: 500,
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }
}
