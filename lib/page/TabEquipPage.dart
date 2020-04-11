import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabEquipPage extends StatefulWidget {
  @override
  _TabEquipListState createState() => _TabEquipListState();
}

class _TabEquipListState extends State<TabEquipPage>
    with AutomaticKeepAliveClientMixin {
  final scrollControler = new ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      scrollDirection: Axis.vertical,
      reverse: false,
      primary: false,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(5.0),
      controller: scrollControler,
      itemExtent: 50,
      children: <Widget>[
        _getMainListItem("武器"),
        _getMainListItem("装备"),
        _getMainListItem("插件"),
      ],
    );
  }

  Widget _getMainListItem(String text) {
    var item = new Card(
        color: Colors.grey[50],
        child: ListTile(
          title: new Text(text),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print(text + "按钮");
          },
        ));
    return Container(
      child: item,
    );
  }
}
