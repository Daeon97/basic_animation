import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late CurvedAnimation curvedAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    animController = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      vsync: this,
    );

    curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(
      curvedAnimation,
    )
      ..addListener(() {
        setState(
          () {},
        );
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });

    animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Transform.rotate(
          angle: animation.value,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(
              30.0,
            ),
            child: Image.asset(
              'assets/resocoder.png',
            ),
          ),
        ),
      );
}
