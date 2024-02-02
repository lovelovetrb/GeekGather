import 'package:flutter/material.dart';

class setting_page extends StatelessWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Center(
        child: Text('RSS Reader Setting page'),
      ));
    });
  }
}
