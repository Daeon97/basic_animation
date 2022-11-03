import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.transitionAnimation,
  }) : super(key: key);

  final Animation<double> transitionAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: AnimatedBuilder(
              animation: transitionAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(
                      1,
                      0,
                    ),
                    end: const Offset(
                      0,
                      0,
                    ),
                  ).animate(
                    CurvedAnimation(
                      parent: transitionAnimation,
                      curve: const Interval(
                        0,
                        0.5,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                  ),
                  child: child,
                );
              },
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: transitionAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(
                      -1,
                      0,
                    ),
                    end: const Offset(
                      0,
                      0,
                    ),
                  ).animate(
                    CurvedAnimation(
                      parent: transitionAnimation,
                      curve: const Interval(
                        0.5,
                        1,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                  ),
                  child: child,
                );
              },
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: const Text(
          'Navigate Back',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
