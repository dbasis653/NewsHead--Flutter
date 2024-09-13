import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:news_head/screens/home_screen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/splash_pic.jpg',
                fit: BoxFit.cover,
                width: 400,
                height: 400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'TOP HEADLINES',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 25,
                letterSpacing: 6,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
