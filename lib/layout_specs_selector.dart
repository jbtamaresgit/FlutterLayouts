import 'package:flutter/material.dart';

class LayoutSpecsSelector extends StatefulWidget{
  final String title;
  final List<String> specs;
  final ValueChanged<int> onChangeSpec;
  final bool isDisabled;

  LayoutSpecsSelector({
    this.title,
    this.specs,
    this.onChangeSpec,
    this.isDisabled
  });

  @override
  State<StatefulWidget> createState() => LayoutSpecsSelectorState();
}

class LayoutSpecsSelectorState extends State<LayoutSpecsSelector>{
  int index = 0;

  void update() {
    widget.onChangeSpec(index);
    setState(() {});
  }
  void next() {
    index = index + 1 < widget.specs.length ? index + 1 : 0;
    update();
  }

  void previous() {
    index = index > 0 ? index - 1 : widget.specs.length - 1;
    update();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(children: <Widget>[
        Divider(color: Colors.black),
        Text(widget.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(4.0),
              icon: Icon(Icons.arrow_back),
              onPressed: widget.isDisabled ? null : previous),
            Text(
              widget.specs[index],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: widget.isDisabled ? Colors.grey : Colors.black,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(4.0),
              icon: Icon(Icons.arrow_forward),
              onPressed: widget.isDisabled ? null : next,
            )
          ],
        )
      ],)
    );
  }
}