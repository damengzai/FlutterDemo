///首页tab
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _list = List<String>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      _list.add(i.toString() + "---===");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemExtent: 50,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(_list[index]);
        },
      ),
    );
  }
}
