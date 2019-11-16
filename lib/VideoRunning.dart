import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';

class VideoRun extends StatefulWidget {
  @override
  _VideoRun createState() => new _VideoRun();
  var img;
  VideoRun({this.img});
}

class _VideoRun extends State<VideoRun> {
  // title: 'Welcome to Flutter',
  // home: Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.black,
  //       elevation: 0.0,
  //     ),
  //     body: Material(
  //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
  //       child: Image.asset(widget.img),
  //     )),
  Future<void> _initializeVideoPlayerFuture;
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    //  _controller = VideoPlayerController.network("pass server link of video u want to play");
    _controller = VideoPlayerController.asset("offline_video/test2.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
    _controller.setVolume(1.0);
    // _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Container(
          child: _controller.value.initialized
              ? RotatedBox(
                  quarterTurns: 0,
                child :AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              )
              : Container(child: Image.asset(widget.img)),
          //     child: AspectRatio(
          //   aspectRatio: _controller.value.aspectRatio,
          //   child: VideoPlayer(_controller),
          // )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },

          
          child: new IconTheme(
    data: new IconThemeData(
   color: Colors.blue), 
    child: new Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
),
),
          
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
