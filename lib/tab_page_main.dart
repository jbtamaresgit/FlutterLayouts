import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_type.dart';
import 'package:flutter_layouts/pages/row_column_layout.dart';
import 'package:flutter_layouts/pages/grid_view_layout.dart';


class TabPage extends StatefulWidget{
  TabPage({Key key}) : super (key : key);

  @override
  _TabPageState createState() => new _TabPageState();
}

class _TabPageState extends State<TabPage>{
  LayoutType selectedLayout = LayoutType.rowColumn;

  Widget build(BuildContext context){
    return Scaffold(body: _buildTabBody(),
    bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

//building tab content

  Widget _buildTabBody(){
    LayoutType layoutTypeSelection = selectedLayout;
    switch(layoutTypeSelection){
      case LayoutType.rowColumn:
        return RowColumnLayoutPage();
      case LayoutType.gridView:
        return GridViewLayoutPage();
      case LayoutType.listView:
        return null;
      case LayoutType.stackView:
        return null;
    }

    return null;
  }

  void _selectedLayout(LayoutType selected){
    setState( (){
      selectedLayout = selected;
    });
  }

  void _onSelectTab(int index){
    switch(index){
      case 0:
        _selectedLayout(LayoutType.rowColumn);
        break;
      case 1:
        _selectedLayout(LayoutType.gridView);
        break;
      case 2:
        _selectedLayout(LayoutType.listView);
        break;
      case 3:
        _selectedLayout(LayoutType.stackView);
        break;
    }
  }

//building bottomNavigation bar

Color _colorTab({LayoutType layoutSelected}){
  return selectedLayout == layoutSelected ? Colors.black : Colors.grey;
}

BottomNavigationBarItem _buildTabItem({IconData icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTab(layoutSelected: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTab(layoutSelected: layoutSelection),
        ),
      ),
    );
}

Widget _buildBottomNavigationBar(){
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: [
      _buildTabItem(icon: Icons.apps, layoutSelection: LayoutType.rowColumn),
      _buildTabItem(icon: Icons.border_all, layoutSelection: LayoutType.gridView),
      _buildTabItem(icon: Icons.format_list_bulleted, layoutSelection: LayoutType.listView),
      _buildTabItem(icon: Icons.layers, layoutSelection: LayoutType.stackView)
    ],
    onTap: _onSelectTab,
  );
}
 
}

