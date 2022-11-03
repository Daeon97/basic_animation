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
      end: 1,
    ).animate(
      curvedAnimation,
    )..addStatusListener((status) {
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
        body: RotatingTransition(
          angle: animation,
          child: ResocoderImage(),
        ),
      );
}

class RotatingTransition extends StatelessWidget {
  const RotatingTransition({
    Key? key,
    required this.angle,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) => Transform.rotate(
        angle: angle.value,
        child: child,
      ),
    );
  }
}

class ResocoderImage extends StatelessWidget {
  const ResocoderImage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          30.0,
        ),
        child: Image.asset(
          'assets/resocoder.png',
        ),
      );
}
