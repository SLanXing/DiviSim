
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabPersonPage extends StatefulWidget{

  @override
  _TabPersonState createState()  => _TabPersonState();
}

class _TabPersonState extends State<TabPersonPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO TabPersonPage initState
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: TabPersonPage design
    return Center(
      child: new Text("TabPersonPage"),
    );
  }


}