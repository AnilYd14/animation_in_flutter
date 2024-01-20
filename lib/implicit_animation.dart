import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() => _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: EdgeInsets.all(_margin),
            width: _width,
            color: _color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('animate margin'),
                  onPressed: () => setState(() => _margin = 50),
                ),
                ElevatedButton(
                  child: const Text('animate color'),
                  onPressed: () => setState(() => _color = Colors.purple),
                ),
                ElevatedButton(
                  child: const Text('animate width'),
                  onPressed: () => setState(() => _width = 400),
                ),
                ElevatedButton(
                  child: const Text('animate opacity'),
                  onPressed: () => setState(() => _opacity=_opacity ==0?1:0),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _opacity,
                  child: const Text(
                      'hide me',
                      style: TextStyle(color: Colors.white)
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
