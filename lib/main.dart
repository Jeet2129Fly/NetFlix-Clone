import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'VideoRunning.dart';
import 'package:netflix/VideoRunning.dart';
import 'package:netflix/Home.dart';

void main() => runApp(MyApp());


final routes ={
  '/' :(BuildContext context) => new HomePage(),
  '/VideoRunning' :(BuildContext context) => new VideoRun(),

};


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NetFlix',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}



