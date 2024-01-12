import 'package:flutter/material.dart';

class ManageItem<T> extends StatefulWidget {
  final Widget? headerWidget;
  final Widget? footerWidget;
  final Widget itemWidget;
  final List<T> list;

  const ManageItem({
    Key? key,
    required this.headerWidget,
    required this.footerWidget,
    required this.itemWidget,
    required this.list
  }) : super(key: key);

  @override
  _ManageItemState createState() => _ManageItemState();
}

class _ManageItemState extends State<ManageItem>{

  int _listLengthCalculator() {
    int itemCount = widget.list.length;

    // If headerWidget exists, increment itemCount
    if (widget.headerWidget != null) {
      itemCount++;
    }

    // If footerWidget exists, increment itemCount
    if (widget.footerWidget != null) {
      itemCount++;
    }

    return itemCount;
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _listLengthCalculator(),
      itemBuilder: (context, index) {
        // HEADER
        if (index == 0 && widget.headerWidget != null) {
          return widget.headerWidget;
        }
        // FOOTER
        else if (index == _listLengthCalculator() - 1 && widget.footerWidget != null) {
          return widget.footerWidget;
        }
        // LIST ITEM
        else {
          return widget.itemWidget;
        }
      },
    );
  }
}