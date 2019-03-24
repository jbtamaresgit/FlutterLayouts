import 'package:flutter/material.dart';
import 'package:flutter_layouts/mainAppBar.dart';
import 'package:flutter_layouts/layout_type.dart';
import 'package:flutter_layouts/pages/row_column_layout_specs.dart';

class RowColumnLayoutPage extends StatefulWidget{
  RowColumnLayoutPage({Key key}) : super (key : key);

  @override
  RowColumnLayoutPageState createState () => new RowColumnLayoutPageState();
}

class RowColumnLayoutPageState extends State<RowColumnLayoutPage>{
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.min;

  void _updateLayout(int index) {
    setState(() {
      _isRow = index == 0;
    });
  }

  MainAxisAlignment _mainAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }

  void _updateMainAxisAlignment(int index) {
    setState(() {
      _mainAxisAlignment = _mainAxisAlignmentFromIndex(index);
    });
  }

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
    }
    return CrossAxisAlignment.start;
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  void _updateMainAxisSize(int index){
    setState((){
      _mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max;
    });
  }

  Widget _buildBodyContent(){
    if(_isRow){
      return Row(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: <Widget>[
          Icon(Icons.cake, size: 70.0),
          Icon(Icons.cake, size: 100.0),
          Icon(Icons.cake, size: 70.0),
        ],
      );
    }
    else{
      return Column(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: <Widget>[
          Icon(Icons.cake, size: 70.0),
          Icon(Icons.cake, size: 100.0),
          Icon(Icons.cake, size: 70.0),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MainAppBar(
      layoutType: LayoutType.rowColumn,
      bottom: PreferredSize(
        preferredSize: Size(0.0, 160.0),
        child: _buildLayoutSpecs(),
      )),
      body: Container(color: Colors.white, child:_buildBodyContent())
    );
  }

  Widget _buildLayoutSpecs(){
    return RowColumnLayoutSpecs(
      onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
      onUpdateLayout: _updateLayout,
      onUpdateMainAxisAlignment: _updateMainAxisAlignment,
      onUpdateMainAxisSize: _updateMainAxisSize,
    );
  }



}