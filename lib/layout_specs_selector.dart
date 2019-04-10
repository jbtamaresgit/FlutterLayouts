import 'package:flutter/material.dart';

class LayoutSpecsSelector extends StatefulWidget{
  final String title;
  final List<String> specs;
  final ValueChanged<int> onChangeSpec;
  final bool isDisabled;
  final bool isOnListView;
  final ValueChanged<bool> isListViewFixedIntent;

  LayoutSpecsSelector({
    this.title,
    this.specs,
    this.onChangeSpec,
    this.isDisabled = false,
    this.isOnListView = false,
    this.isListViewFixedIntent
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
              disabledColor: Colors.grey,
              onPressed: isWidgetDisabledPrevious()),
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
              disabledColor: Colors.grey,
              onPressed: isWidgetDisabledNext(),
            )
          ],
        )
      ],)
    );
  }

  Function isWidgetDisabledPrevious(){
    if(widget.isOnListView && widget.isListViewFixedIntent){
      return null;
    }

    return widget.isDisabled ? null : previous;
  }

  Function isWidgetDisabledNext(){
    if(widget.isOnListView && widget.isListViewFixedIntent){
      return null;
    }

    return widget.isDisabled ? null : previous;
  }


}