import 'package:flutter/material.dart';
import 'package:flutter_layouts/layout_type.dart';

class MainAppBar extends AppBar{
  MainAppBar({
    LayoutType layoutType,
    PreferredSize bottom,
  }) : super(
    title: Text(layoutName(layoutType)),
    elevation: 1.0,
    bottom: bottom
  );
}