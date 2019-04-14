import 'package:flutter/material.dart';
import 'package:flutter_layouts/mainAppBar.dart';
import 'package:flutter_layouts/layout_type.dart';


class StackViewLayoutPage extends StatefulWidget{
  StackViewLayoutPage({Key key}) : super(key : key);

  @override
  StackViewLayoutPageState createState () => new StackViewLayoutPageState();
}

class StackViewLayoutPageState extends State<StackViewLayoutPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: MainAppBar(
      layoutType: LayoutType.stackView,
    ),
      body: Container(color: Colors.white, child: _buildBodyContent())
    );
  }


  Widget _buildBodyContent(){
    return new Stack(
    children: <Widget>[
      new Container(
        color: Colors.black,
        height: 500.0,
        width: 500.0,
        child: new Text('This is the bottom widget', 
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: new Container(
        color: Colors.red,
        height: 300.0,
        width: 300.0,
        child: new Text('This is the middle widget',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        ))),
      Align(
        alignment: Alignment.bottomRight,
        child: new Container(
        color: Colors.white,
        height: 150.0,
        width: 150.0,
        child: new Text('This is the top widget',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
      ))
    ],);
  }
}
