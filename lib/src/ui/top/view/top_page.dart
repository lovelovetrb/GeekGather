import 'package:flutter/material.dart';

class top_page extends StatelessWidget {
  const top_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Center(
          child: Text('RSS Reader top page'),
        ),
      );
    });
  }
}
