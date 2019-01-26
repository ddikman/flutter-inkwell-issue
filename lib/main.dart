import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InkWell issue',
      home: MyHomePage(title: 'InkWell issue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ColorChoice> colors = [
    ColorChoice(Colors.yellow, "yellow"),
    ColorChoice(Colors.blue, "blue"),
    ColorChoice(Colors.red, "red"),
    ColorChoice(Colors.green, "green")
  ];

  @override
  Widget build(BuildContext context) {
    var cards = colors
        .map((color) => new Card(
              color: color.color,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () => openDialog(color),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(color.name,
                        style: TextStyle(color: Colors.black, fontSize: 24.0)),
                  ),
                ),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Reproduce the issue by pressing two of the below at the same time. One may then get stuck in the inkwell highlight."),
            ),
            Column(children: cards)
          ]),
    );
  }

  openDialog(ColorChoice color) {
    showDialog(context: context, barrierDismissible: true,
    builder: (context) => new Dialog(child: Padding(
      padding: const EdgeInsets.all(64.0),
      child: Text("pressed ${color.name}", style: TextStyle(fontSize: 16.0),),
    )));
  }
}

class ColorChoice {
  final MaterialColor color;
  final String name;

  ColorChoice(this.color, this.name);
}
