import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(
      begin: 20,
      end: -20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_animation.value, 0),
                child: Image.asset(
                  'assets/SplashScreen_bg.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 350),
              const Image(
                image: AssetImage('assets/logo.png'),
                width: 120,
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  children: const [
                    Text(
                      'Pakistan ki sabse sasti shopping application',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 97, 52, 234),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Made with ❤️ in Pakistan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 14,
                        color: Color.fromARGB(255, 97, 52, 234),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
