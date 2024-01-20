import 'package:flutter/material.dart';
import 'package:fluuter_animation_km/heart.dart';
import 'package:fluuter_animation_km/heart_tween_squence.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
              tag: 'location-img',
              child: Image.asset(
                'images/beach.png',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            const SizedBox(height: 30),
            ListTile(
                title: Text('trip.title',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800])),
                subtitle: const Text(
                    '${'trip.nights'} night stay for only \$${'trip.price'}',
                    style: TextStyle(letterSpacing: 1)),
                // trailing: const Heart()),
                trailing: const HeartTweenSequence()),
          ],
        ));
  }
}
