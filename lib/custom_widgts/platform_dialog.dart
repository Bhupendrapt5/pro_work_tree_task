import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/custom_widgts/platfom_widget.dart';

class PlatFormDialogBox extends PlatformWidget {
  final Widget content;

  PlatFormDialogBox({
    @required this.content,
  });

  Future<Widget> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<Widget>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<Widget>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return Dialog(
      child: content,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Dialog(
      child: content,
    );
  }
}
