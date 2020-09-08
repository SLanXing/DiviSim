import 'dart:convert';

import 'package:DiviSim/tools/LocalFileTool.dart';
import 'package:flutter/cupertino.dart';
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
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: false,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(5.0),
        controller: scrollControler,
        itemExtent: 50,
        children: <Widget>[
          _getSimListView(),
          CupertinoButton(
            color: Colors.lightBlue,
            child: Text("+"),
            onPressed: () {
              print("新建配装");
              loadAsset();
            },
          )
        ],
      ),
    );
  }

  _getSimListView() {
    var content;
    var length = simList.length;
    if (simList.isEmpty || 0 == length) {
      content = new Card(
        color: Colors.grey[50],
        child: new Text("未发现数据"),
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

  void loadAsset() async {
    await rootBundle.loadString("asset/basicdata/typedata.json").then((value) {
      var _typejson = json.decode(value);
//      print(_typejson);
    });
//    print("loadAsset:$fileContent");
  }
}
