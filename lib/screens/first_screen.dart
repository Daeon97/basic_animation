import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return SecondScreen(
                  transitionAnimation: animation,
                );
              },
              transitionDuration: const Duration(
                seconds: 1,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
