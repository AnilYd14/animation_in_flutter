import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluuter_animation_km/default_tag.dart';

class StaggeredAnimationScreen extends StatelessWidget {
  const StaggeredAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTagWidget()
          ],
        ),
      ),
    );
  }
}
