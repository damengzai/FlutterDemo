import 'package:demo/ui/Chat.dart';
import 'package:demo/ui/Home.dart';
import 'package:demo/ui/Mine.dart';
import 'package:demo/ui/Third.dart';
import 'package:flutter/material.dart';

///首页
///
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final _bottomNavigationColor = Colors.blue;
  List<Widget> pages = List<Widget>();
  final _bottomNavigationBarItemColor = Colors.teal;
  int _currentIndex = 0;

  void _selectTab(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages..add(HomePage())..add(ChatPage())..add(ThirdPage())..add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main'),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'CHAT',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: _bottomNavigationColor,
              ),
              title: Text('THIRD'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_ind,
                color: _bottomNavigationColor,
              ),
              title: Text('MINE'),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            _selectTab(index);
          },
        ));
  }
}
