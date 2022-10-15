import 'package:flutter/cupertino.dart';

class DynamicTheme extends StatelessWidget {
  final Widget child;
  final Brightness brightness;

  DynamicTheme({required this.child, this.brightness = Brightness.light});

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      child: child,
      data: brightness == Brightness.dark
          ? const CupertinoThemeData(
              brightness: Brightness.dark,
              primaryColor: CupertinoColors.systemTeal,
              //primaryContrastingColor: Color(0xFFFFFFFF),
              // barBackgroundColor: ,
              scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
              // textTheme: ,
            )
          : const CupertinoThemeData(
              brightness: Brightness.light,
              primaryColor: CupertinoColors.systemBlue),
    );
  }
}
