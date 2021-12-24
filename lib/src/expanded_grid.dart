import 'package:flutter/material.dart';
import 'expanded_grid_content.dart';

class ExpandedGrid extends StatelessWidget {
  final int column, row; // divide equally
  final List<ExpandedGridContent> children;

  ExpandedGrid({Key? key, this.column = 1, this.row = 1,required this.children}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        var contentWidth = boxConstraint.biggest.width / column;
        var contentHeight = boxConstraint.biggest.height / row;

        return Stack(
            children: children.where((e) => !(e.columnIndex < 0 || e.columnIndex + e.columnSpan - 1 >= column
                || e.rowIndex < 0 || e.rowIndex + e.rowSpan - 1 >= row)).map((gridContent) {
              return Positioned(
                top: contentHeight * gridContent.rowIndex,
                left: contentWidth * gridContent.columnIndex,
                child: SizedBox(
                  height: contentHeight * gridContent.rowSpan,
                  width: contentWidth * gridContent.columnSpan,
                  child: gridContent,
                ),
              );
            }).toList() as List<Widget>
        );
      },
    );
  }
}
