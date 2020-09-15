import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/widget/loding.dart';

class LoadingIndicatorWithMessage extends StatelessWidget {
  final String text;

  const LoadingIndicatorWithMessage({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.30,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Loading(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
