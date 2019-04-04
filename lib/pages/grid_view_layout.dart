import 'package:flutter/material.dart';
import 'package:flutter_layouts/mainAppBar.dart';
import 'package:flutter_layouts/layout_type.dart';
import 'package:flutter_layouts/pages/grid_view_layout_specs.dart';

class GridViewLayoutPage extends StatefulWidget{
  GridViewLayoutPage({Key key}) : super(key : key);

  @override
  GridViewLayoutPageState createState () => new GridViewLayoutPageState();
}

class GridViewLayoutPageState extends State<GridViewLayoutPage>{
  bool _isRow = true;
  int _crossAxisCount = 1;
  double _crossAxisSpacing = 1;

  void _updateLayout(int index){
    setState(() {
      _isRow = index == 0;
    });
  }

  void _updateCrossAxisCount(String crossAxisCountValue){
    setState((){
      _crossAxisCount = int.tryParse(crossAxisCountValue);
    });
  }

  void _updateCrossAxisSpacing(String crossAxisSpacing){
    setState((){
      _crossAxisSpacing = double.tryParse(crossAxisSpacing);
    });
  }


  Widget _buildBodyContent(){
    List<Widget> items = new List<Widget>(_crossAxisCount);

    for(int x = 1; x <= _crossAxisCount; x++){
      items.add(Icon(Icons.cake, size: 40.0));
    }


    if(_isRow){
      return new GridView.count(
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing,
        scrollDirection: Axis.horizontal,
        children: items,
      );
    }
    else{
      return new GridView.count(
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing,
        scrollDirection: Axis.vertical,
        children: items
      );
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: MainAppBar(
      layoutType: LayoutType.gridView,
      bottom: PreferredSize(
        preferredSize: Size(0.0, 160.0),
        child: _buildLayoutSpecs()
      )),
      body: Container(color: Colors.white, child: _buildBodyContent())
    );
  }

  Widget _buildLayoutSpecs(){
    return GridViewLayoutSpecs(
      onUpdateCrossAxisCount: _updateCrossAxisCount,
      onUpdateCrossAxisSpacing: _updateCrossAxisSpacing,
      onUpdateScrollDirection: _updateLayout);
  }


}