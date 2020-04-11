import 'package:flutter/material.dart';
import 'package:divisim/page/TabEquipPage.dart';
import 'package:divisim/page/TabSimulateEquipPage.dart';
import 'package:divisim/page/TabPersonPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '全境配装模拟器'),
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
  int _selectIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _selectIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new PageView(
        children: <Widget>[
          new TabEquipPage(),
          new TabSimulateEquipPage(),
          new TabPersonPage()
        ],
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.album), title: Text("装备图鉴")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("配装模拟")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("个人信息")),
        ],
        currentIndex: _selectIndex,
        onTap: navigationTapped,
      ),
    );
  }

  void navigationTapped(int index) {
    _pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      this._selectIndex = index;
    });
  }
}
