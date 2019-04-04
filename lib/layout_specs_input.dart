import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final textController = TextEditingController(text: "1");

  @override
  void initState(){
    super.initState();

    textController.addListener(update);
  }

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
            new Container(child: new Flexible(child:
            TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ))
           
          ],
        )
      ],
    ));

  }

}