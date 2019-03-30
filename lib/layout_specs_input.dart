import 'package:flutter/material.dart';

class LayoutSpecsInput extends StatefulWidget{
  final String title;
  final ValueChanged<String> onChangeSpec;

  LayoutSpecsInput({
    this.title,
    this.onChangeSpec
  });

  @override
  State<StatefulWidget> createState() => LayoutSpecsInputState();

}

class LayoutSpecsInputState extends State<LayoutSpecsInput>{
  final textController = TextEditingController();

  void update(){
    widget.onChangeSpec(textController.text);
    setState(() {});
  }

  @override build(BuildContext context){
    return Container(child: Column(
      children: <Widget>[
        Divider(color: Colors.black),
        Text(widget.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextField(
              controller: textController,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ));

  }

}