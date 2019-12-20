
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class FadeAnimation extends StatelessWidget {
  final double delay;
  final List<Track> translates;
  final Widget child;

  FadeAnimation(this.delay, this.translates, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween(translates);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) {
        return Opacity(
          opacity: animation["opacity"],
          child: Transform.translate(
            offset: animation["translateX"] != null ? Offset(animation["translateX"], 0) : Offset(0, animation["translateY"]), 
            child: child
          ),
        );
      },
    );
  }
}
