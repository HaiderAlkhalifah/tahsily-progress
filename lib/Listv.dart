import 'package:flutter/material.dart';

class ListDisplay extends StatefulWidget {
  ListDisplay({@required this.children});

  final List<Widget> children;

  @override
  State createState() => new DyanmicList(homepage: this.children);
}

class DyanmicList extends State<ListDisplay> {
  DyanmicList({@required this.homepage});

  final List<Widget> homepage;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView.builder(
        itemCount: this.homepage.length,
        itemBuilder: (BuildContext context, int index) {
          return this.homepage[index];
        },
      ),
    );
  }
}
