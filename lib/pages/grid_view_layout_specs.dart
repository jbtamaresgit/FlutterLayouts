import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_specs_selector.dart';
import 'package:flutter_layouts/layout_specs_input.dart';

class GridViewLayoutSpecs extends StatelessWidget{
  final ValueChanged<String> onUpdateCrossAxisCount;
  final ValueChanged<int> onUpdateCrossAxisSpacing;
  final ValueChanged<int> onUpdateScrollDirection;

  GridViewLayoutSpecs({
    this.onUpdateCrossAxisCount,
    this.onUpdateCrossAxisSpacing,
    this.onUpdateScrollDirection
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
            LayoutSpecsInput(title: 'Cross Axis Count',
              onChangeSpec: onUpdateCrossAxisCount,
            )
          ],
        )),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              LayoutSpecsSelector(
                title: 'Cross Axis Spacing',
                specs:[
                  'start',
                  'end',
                  'center',
                  'space\nbetween',
                  'space\naround',
                  'space\nevenly'
                ],
                onChangeSpec: onUpdateCrossAxisSpacing,
              )
            ],
          ))
      ],
    );
  }

}