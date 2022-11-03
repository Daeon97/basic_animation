import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      vsync: this,
    );

    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
      reverseCurve: Curves.bounceOut,
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      curvedAnimation,
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          animationController.forward();
        } else if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
        builder: (context, child) => RotatingTransition(
          angle: animation,
          child: child!,
        ),
      ),
    );
  }
}

class RotatingTransition extends StatelessWidget {
  const RotatingTransition({
    Key? key,
    required this.angle,
    required this.child,
  }) : super(key: key);

  final Animation<double> angle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: angle.value,
      child: child,
    );
  }
}
