
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;

import 'package:flutter_27may2021/on_activity_for_result/page_2.dart';

class Page_1 extends StatefulWidget {
  Page_1({Key key}) : super(key: key);

  @override
  _Page_1State createState() => new _Page_1State();

}

class _Page_1State extends State<Page_1> {

  String _selection,Key1;
  Widget widget_;

  @override
  Widget build(BuildContext context) {
    Widget buttonWidget = new FlatButton(
      height: 100,
      textColor: Colors.blueGrey,
      color: Colors.grey,
      child: new Text('To Selection Screen'),
      onPressed: _buttonTapped,
    );

    List<Widget> widgets = new List<Widget>();
    widgets.add(buttonWidget);
    if (_selection != null) {
      /*Widget textWidget = new Text(_selection+" --> KEY-1 -> "+Key1);*/
      Widget containerWidger=new Container(child: Column(children: [
        new Text(_selection+" --> KEY-1 -> "+Key1),
        widget_
      ],),);
      widgets.add(containerWidger);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page, with selection"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: new Column(
          children: widgets,
        ),
      ),
    );
  }


  Future _buttonTapped() async {

    Map results =  await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new Page_2();
      },
    ));

    print(results);

    if (results != null && results.containsKey('selection') && results.containsKey('Key1')) {
      setState(() {
        _selection = results['selection'];
        Key1 = results['Key1'];
        widget_=results['Widget'];
      });
    }
  }



}