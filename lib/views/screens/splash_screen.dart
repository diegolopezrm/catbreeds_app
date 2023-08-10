import 'package:catbreeds_app/views/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLandingScreen();
  }

  _navigateToLandingScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Metaballs(
        effect: MetaballsEffect.follow(
          growthFactor: 1,
          smoothing: 1,
          radius: 0.5,
        ),
        gradient: const LinearGradient(colors: [
          Colors.orangeAccent,
          Colors.orange,
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        metaballs: 40,
        animationDuration: const Duration(milliseconds: 200),
        speedMultiplier: 1,
        bounceStiffness: 3,
        minBallRadius: 15,
        maxBallRadius: 40,
        glowRadius: 0,
        glowIntensity: 0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Text('Catbreeds',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 20.0),
              Image.asset('assets/images/cat.png', height: 100.0, width: 100.0),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
