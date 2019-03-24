import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_type.dart';

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
}