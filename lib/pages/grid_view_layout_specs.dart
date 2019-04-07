import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_specs_selector.dart';
import 'package:flutter_layouts/layout_specs_input.dart';

class GridViewLayoutSpecs extends StatelessWidget{
  final ValueChanged<String> onUpdateCrossAxisCount;
  final ValueChanged<String> onUpdateCrossAxisSpacing;
  final ValueChanged<String> onUpdateNumberOfItems;
  final ValueChanged<int> onUpdateScrollDirection;

  GridViewLayoutSpecs({
    this.onUpdateCrossAxisCount,
    this.onUpdateCrossAxisSpacing,
    this.onUpdateScrollDirection,
    this.onUpdateNumberOfItems
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
            LayoutSpecsSelector(title: 'Scroll Direction',
              specs: ['row', 'column'],
              onChangeSpec: onUpdateScrollDirection,
            ),
            LayoutSpecsInput(title: 'Axis Count',
              onChangeSpec: onUpdateCrossAxisCount ,
            )
          ],
        )),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              LayoutSpecsInput(title: 'Axis Spacing',
              onChangeSpec: onUpdateCrossAxisSpacing ),
              LayoutSpecsInput(title: 'Item Count',
                onChangeSpec: onUpdateNumberOfItems)
            ],
          ))
      ],
    );
  }

}