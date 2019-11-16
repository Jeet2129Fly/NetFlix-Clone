import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/VideoRunning.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  String titleof = "";

  //homepage GridView coding

  final List<String> _dropdownValues = [
    "Discover",
    "Treding",
    "Popular",
    "Top Rated",
    "Drama",
    "Comdey",
    "Crime"
  ];

  String _currentlySelected = "";

  Widget dropdownWidget() {
    return DropdownButton(
      iconEnabledColor: Colors.white,
      elevation: 10,
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      onChanged: (String value) {
        setState(() {
          _currentlySelected = value;
        });
      },
      isExpanded: false,
      value: _dropdownValues.first,
    );
  }

// Get grid tiles

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            dropdownWidget(),
          ],
        ),

        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(),
              children: <Widget>[
                new Container(
                  color: Colors.black,
                ),
                DrawerHeader(
                  child: new ClipOval(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Image.asset('images/panda.jpg'),
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                  ),
                ),
                ListTile(
                  trailing: new Icon(Icons.movie),
                  title: Text('Movies'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  trailing: new Icon(Icons.hd),
                  title: Text('HD Relaeses'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                new Divider(),
                ListTile(
                  trailing: new Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),

        //body: Center(child: Text(_currentlySelected)),

        body: new GridView.extent(
          // crossAxisCount: 3,
          maxCrossAxisExtent: 160,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: _gridLines(20),
        ),
      ),
    );
  }

  List<Widget> _gridLines(numberOfTiles) {
    List<Container> containers =
        new List<Container>.generate(numberOfTiles, (int index) {
      final imageName = 'images/image${index + 1}.jpg';
      // final name={'abc','cda'};
      return new Container(
        child: Ink.image(
          image: AssetImage(imageName),
          // child: Text(),
          fit: BoxFit.cover,
          width: 80.0,
          height: 140.0,
          child: InkWell(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoRun(img: imageName),
                ));
          }),
        ),
      );
    });
    return containers;
  }
}
