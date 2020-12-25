import 'package:flutter/material.dart';

class ExpandedGridContent extends StatelessWidget {
  final int columnIndex, rowIndex; // index from TopLeft
  final int columnSpan, rowSpan; // specify how many pieces of Grid
  final Widget child;

  ExpandedGridContent({
    Key? key,
    this.columnIndex = 0,
    this.rowIndex = 0,
    this.columnSpan = 1,
    this.rowSpan = 1,
    required this.child
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}