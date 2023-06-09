import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import '../models/video.dart';

class VideoTitle extends StatefulWidget {
  const VideoTitle(
      {super.key,
      required this.video,
      required this.snappedPageIndex,
      required this.currentIndex});
  final Video video;
  final int snappedPageIndex;
  final int currentIndex;

  @override
  State<VideoTitle> createState() => _VideoTitleState();
}

class _VideoTitleState extends State<VideoTitle> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;
  // bool _isPlaying = false;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.asset('assets/${widget.video.videoUrl}');
    _initializeVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // (widget.snappedPageIndex == widget.currentIndex)
    //     ? _videoController.play()
    //     : _videoController.pause();
    return Container(
        color: Colors.black,
        child: FutureBuilder(
          future: _initializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return VideoPlayer(_videoController);
            } else {
              return Container(
                  alignment: Alignment.center,
                  child: Lottie.asset('assets/tiktok-loader.json'));
            }
          },
        ));
  }
}
