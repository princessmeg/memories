import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'dart:async';

class CachedVideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const CachedVideoPlayerPage({super.key, required this.videoUrl});

  @override
  State<CachedVideoPlayerPage> createState() => _CachedVideoPlayerPageState();
}

class _CachedVideoPlayerPageState extends State<CachedVideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    _initializeVideo(widget.videoUrl);
  }

  Future<void> _initializeVideo(String url) async {
    FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(url);
    File file;

    if (fileInfo != null) {
      file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(url));
      downloadFile(url);
    }

    await _controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      showOptions: false,
    );
    setState(() {
      _isInitialized = true;
      _controller.play();
    });
  }

  downloadFile(String url) async{
    DefaultCacheManager().downloadFile(url);
  }


  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ?
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: Chewie(controller: chewieController),
            ),
          ),
        )
        : const Center(child: CircularProgressIndicator());
  }

}
