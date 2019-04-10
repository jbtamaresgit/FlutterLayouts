import 'package:flutter/material.dart';
import 'package:flutter_layouts/mainAppBar.dart';
import 'package:flutter_layouts/layout_type.dart';
import 'package:flutter_layouts/pages/list_view_layout_specs.dart';

class ListViewLayoutPage extends StatefulWidget{
  ListViewLayoutPage({Key key}) : super (key: key);

  @override
  ListViewLayoutPageState createState () => new ListViewLayoutPageState();
}

class ScrollPhysicsConsts{
  static const int _never = 0;
  static const int _bounce = 1;
  static const int _clamp = 2;
  static const int _fixedExtent = 3;
}

class ListViewLayoutPageState extends State<ListViewLayoutPage>{
  bool _isRow = true;
  bool _isReverseScroll = false;
  ScrollPhysics _scrollPhysics = NeverScrollableScrollPhysics();
  int _numberOfItems = 1;
  int _scrollPhysicsItem = 0;

  void _updateLayout(int index){
    setState((){
      _isRow = index == 0;
    });
  }

  void _updateReverseScroll(int index){
    setState((){
      _isReverseScroll = index == 1;
    });
  }

  void _updateNumberOfItems(String numberOfItems){
    setState((){
      _numberOfItems = int.tryParse(numberOfItems);
    });
  }

  void _updateScrollPhysics(int index){
    setState((){
      _scrollPhysics = _scrollPhysicsSelector(index);
    });
  }


  ScrollPhysics _scrollPhysicsSelector(index){
    switch (index){
      case 0:
        _scrollPhysicsItem = ScrollPhysicsConsts._never;
        return NeverScrollableScrollPhysics();
      case 1:
        _scrollPhysicsItem = ScrollPhysicsConsts._bounce;
        return BouncingScrollPhysics();
      case 2:
        _scrollPhysicsItem = ScrollPhysicsConsts._clamp;
        return ClampingScrollPhysics();
      case 3:
        _scrollPhysicsItem = ScrollPhysicsConsts._fixedExtent;
        return FixedExtentScrollPhysics();
    }

    return NeverScrollableScrollPhysics();
  }



  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar: MainAppBar(
      layoutType: LayoutType.listView,
      bottom: PreferredSize(
        preferredSize: Size(0.0, 160.0),
        child: _buildLayoutSpecs()
      )),
      body: Container(color: Colors.white, child: _buildBodyContent())
    );
  }

  Widget _buildLayoutSpecs(){
    return ListViewLayoutSpecs(
      onUpdateIsReverseScroll: _updateReverseScroll,
      onUpdateNumberOfItems: _updateNumberOfItems,
      onUpdateScrollDirection: _updateLayout,
      onUpdateScrollPhysics: _updateScrollPhysics);
  }

  FixedExtentScrollController _fixedExtentScrollController =
    new FixedExtentScrollController();

  Widget _buildBodyContent(){
    List<Widget> items = new List<Widget>();

    if(_numberOfItems <= 0 || _numberOfItems == null){
      _numberOfItems = 1;
    }

    for(int x = 0; x < _numberOfItems; x++){
      items.add(new Icon(Icons.cake, size: 40.0));
    }

    if(_isRow && _scrollPhysicsItem == ScrollPhysicsConsts._fixedExtent){
      return new ListWheelScrollView(
        controller: _fixedExtentScrollController,
        physics: _scrollPhysics,
        children: items,
        itemExtent: 60.0
      );
    }
    else if(_isRow){
       return new ListView.custom(
        scrollDirection: Axis.vertical,
        physics: _scrollPhysics,
        reverse: _isReverseScroll,
        childrenDelegate: SliverChildListDelegate(items),
      );
    }
    else if(!_isRow && _scrollPhysicsItem == ScrollPhysicsConsts._fixedExtent){
      return new ListWheelScrollView(
        controller: _fixedExtentScrollController,
        physics: _scrollPhysics,
        children: items,
        itemExtent: 60.0
      );
    }
    else{
      return new ListView.custom(
        scrollDirection: Axis.horizontal,
        physics: _scrollPhysics,
        reverse: _isReverseScroll,
        childrenDelegate: SliverChildListDelegate(items),
      );
    }

  }


}
