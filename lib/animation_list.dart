import 'package:flutter/material.dart';
import 'package:fluuter_animation_km/explicit_animation.dart';
import 'package:fluuter_animation_km/implicit_animation.dart';
import 'package:fluuter_animation_km/default_tag.dart';
import 'package:fluuter_animation_km/staggered_animation.dart';
import 'package:fluuter_animation_km/tween_animation.dart';

class AnimationListScreen extends StatelessWidget {
  const AnimationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Implicit Animation'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ImplicitAnimationScreen()));
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('Tween Animation'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TweenAnimationScreen()));
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('Explicit Animation'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailScreen()));
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('Staggered Animation'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const StaggeredAnimationScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
