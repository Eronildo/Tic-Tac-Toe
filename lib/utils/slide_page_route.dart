import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;
  final bool isRight;
  SlidePageRoute({this.widget, this.isRight = true})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: Offset(isRight ? -1.0 : 1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}
