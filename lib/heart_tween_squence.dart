import 'package:flutter/material.dart';

class HeartTweenSequence extends StatefulWidget {
  const HeartTweenSequence({super.key});

  @override
  State createState() => _HeartTweenSequenceState();
}

class _HeartTweenSequenceState extends State<HeartTweenSequence>
    with SingleTickerProviderStateMixin {
  bool isFav = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _colorAnimation =
        ColorTween(begin: Colors.green, end: Colors.red).animate(_controller);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(_controller);

    _controller.addListener(() {
      // print(_controller.value);
      // print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  // dismiss the animation when widgit exits screen
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              isFav ? _controller.reverse() : _controller.forward();
            },
          );
        });
  }
}
