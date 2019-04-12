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
    return new Stack(alignment: const Alignment(0.0, 0.0),
    children: <Widget>[
      new Container(

      )
    ],);
  }
}
