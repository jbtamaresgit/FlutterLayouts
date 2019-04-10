import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_specs_selector.dart';
import 'package:flutter_layouts/layout_specs_input.dart';


class ListViewLayoutSpecs extends StatelessWidget{
  final ValueChanged<int> onUpdateScrollDirection;
  final ValueChanged<int> onUpdateIsReverseScroll;
  final ValueChanged<int> onUpdateScrollPhysics;
  final ValueChanged<String> onUpdateNumberOfItems;
  final ValueChanged<bool> onUpdateIsFixedExtent;

  ListViewLayoutSpecs({
    this.onUpdateScrollDirection,
    this.onUpdateIsReverseScroll,
    this.onUpdateScrollPhysics,
    this.onUpdateNumberOfItems,
    this.onUpdateIsFixedExtent
  });

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              LayoutSpecsSelector(
                title: 'Scroll Direction',
                specs: ['row', 'column'],
                onChangeSpec: onUpdateScrollDirection,
                isListViewFixedIntent: onUpdateIsFixedExtent,
                isOnListView: true,
              ),
              LayoutSpecsSelector(
                title: 'Reverse Scroll Direction',
                specs: ['True', 'False'],
                isOnListView: true,
                isListViewFixedIntent: onUpdateIsFixedExtent,
                onChangeSpec: onUpdateIsReverseScroll,
              )
            ],
          ),),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              LayoutSpecsSelector(
                title: "Scroll Physics",
                specs: ['Never','Bounce', 'Clamp', 'Fixed Extent'],
                onChangeSpec: onUpdateScrollPhysics,
              ),
              LayoutSpecsInput(
                title: "Item Count",
                onChangeSpec: onUpdateNumberOfItems,
              )
            ]
          )
        )
      ],);
  }

}