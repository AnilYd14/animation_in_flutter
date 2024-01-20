import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatelessWidget {
  const TweenAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 160,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 700),
                        builder: _buildAnimation,
                        child: const Text(
                          'Tween Animation',
                          style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: TweenAnimationBuilder(
                        tween: ColorTween(begin: Colors.green, end: Colors.black),
                        duration: const Duration(seconds: 1),
                        builder: _buildColourAnimation,
                      ),
                    ),


                    //Sandbox(),
                  ],
                ))));
  }

  Widget _buildAnimation(BuildContext context, double value, Widget? child) {
    return Opacity(
      opacity: value,
      child: Padding(padding: EdgeInsets.only(top: value * 20), child: child),
    );
  }

  Widget _buildColourAnimation(BuildContext context, Color? value, Widget? child) {
    return Container(
      color: value,
    );
  }
}
