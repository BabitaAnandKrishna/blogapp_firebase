import 'package:flutter/material.dart';



class DisplayPage extends StatefulWidget {

  final String title;
  final String desc;

  DisplayPage(this.title, this.desc);



  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Page"),
      ),
      body: Column(
        children: [
          Text(widget.title),
          Text(widget.desc),
        ],
      ),
    );
  }
}
