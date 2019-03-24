import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_specs_selector.dart';

class RowColumnLayoutSpecs extends StatelessWidget{
  final ValueChanged<int> onUpdateLayout;
  final ValueChanged<int> onUpdateMainAxisAlignment;
  final ValueChanged<int> onUpdateCrossAxisAlignment;
  final ValueChanged<int> onUpdateMainAxisSize;

  RowColumnLayoutSpecs({
    this.onUpdateLayout,
    this.onUpdateMainAxisAlignment,
    this.onUpdateCrossAxisAlignment,
    this.onUpdateMainAxisSize
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
            LayoutSpecsSelector(title: 'Layout',
              specs: ['row', 'column'],
              onChangeSpec: onUpdateLayout,
            ),
            LayoutSpecsSelector(title: 'Main Axis Size',
              specs: ['min', 'max'],
              onChangeSpec: onUpdateMainAxisSize,
            )
          ],
        )),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              LayoutSpecsSelector(
                title: 'Main Axis Alignment',
                specs:[
                  'start',
                  'end',
                  'center',
                  'space\nbetween',
                  'space\naround',
                  'space\nevenly'
                ],
                onChangeSpec: onUpdateMainAxisAlignment,
              ),
              LayoutSpecsSelector(
                title: 'Cross Axis Alignment',
                specs:[
                  'start',
                  'end',
                  'center',
                  'stretch'
                ],
                onChangeSpec: onUpdateCrossAxisAlignment,
              )
            ],
          ))
      ],
    );
  }

}