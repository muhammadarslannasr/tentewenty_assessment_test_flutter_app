import 'package:flutter/cupertino.dart';

class CustomTabView extends StatelessWidget {
  final Widget child;
  late BuildContext tabContext;
  CustomTabView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        tabContext = context;
        return child;
      },
    );
  }
}
