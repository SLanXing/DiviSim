import 'dart:convert';

import 'package:DiviSim/tools/LocalFileTool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/services.dart' show rootBundle;

class TabSimulateEquipPage extends StatefulWidget {
  @override
  _TabSimulateListState createState() => _TabSimulateListState();
}

class _TabSimulateListState extends State<TabSimulateEquipPage>
    with AutomaticKeepAliveClientMixin {
  LocalFileTool lfTool;
  List simList = [];
  final scrollControler = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.expand,
      children: <Widget>[
        ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          primary: false,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(5.0),
          controller: scrollControler,
          itemExtent: 50,
          children: <Widget>[
            _getSimListView(),
          ],
        ),
        Positioned(
            right: 10.0,
            bottom: 10.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    print("新建配装");
                    // _loadAsset();
                  },
                ),
              ),
            ))
      ],
    );
  }

  _getSimListView() {
    var content;
    var length = simList.length;
    if (simList.isEmpty || 0 == length) {
      content = new Card(
        color: Colors.grey[50],
        child: Center(child: new Text("未发现数据"),),
      );
    } else {
      content = new ListView.builder(
        itemCount: simList.length,
        itemBuilder: (BuildContext context, int position) {
          return _getSimListItem(position);
        },
      );
    }
    return content;
  }

  Card _getSimListItem(int position) {
    print("_getSimListItem:" + position.toString());
    return null;
  }

  void loadData() {
    print("loadData");
  }

  void _loadAsset() async {
    await rootBundle.loadString("asset/basicdata/typedata.json").then((value) {
      var _typejson = json.decode(value);
//      print(_typejson);
    });
//    print("loadAsset:$fileContent");
  }
}
