import 'package:flutter/material.dart';

class AnimatedDefaultTagWidget extends StatefulWidget {

  const AnimatedDefaultTagWidget({
    super.key,
  });

  @override
  State<AnimatedDefaultTagWidget> createState() =>
      _AnimatedDefaultTagWidgetState();
}

class _AnimatedDefaultTagWidgetState extends State<AnimatedDefaultTagWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  final int animationTimeInMillis = 800;
  final int opacityTimeInMillis = 100;
  late Animation<double> opacity;
  late Animation<double> widthTween;
  late BorderRadiusTween borderRadius;

  @override
  void initState() {
    super.initState();
    _prepareAnimations(milliSec: animationTimeInMillis);
    _playAnimation();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  void _prepareAnimations({int milliSec = 0}) {
    expandController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliSec));

    widthTween = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: expandController,
        curve: const Interval(0, .8, curve: Curves.fastOutSlowIn),
      ),
    );
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: expandController,
        curve: const Interval(.8, 1),
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: const BorderRadius.all(Radius.circular(0)),
      end: const BorderRadius.all(Radius.circular(4)),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return SafeArea(
      child: SizeTransition(
        axis: Axis.horizontal,
        sizeFactor: widthTween,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: borderRadius.evaluate(CurvedAnimation(
                  parent: expandController, curve: Curves.fastOutSlowIn))),
          padding: const EdgeInsets.all(4),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: opacityTimeInMillis),
            opacity: opacity.value,
            child: const Text(
              'Expand Tag',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: expandController, builder: _buildAnimation);
  }

  void _playAnimation() {
    expandController.forward();
  }
}
