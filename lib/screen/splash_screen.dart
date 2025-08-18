import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/home');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 70, 70),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background image
          Image.asset(
            'assets/splash_screen_img.png',
            fit: BoxFit.cover,
          ),

          /// Overlay mờ
          Container(color: Colors.black.withOpacity(0.3)),

          /// Nội dung ở dưới phân nửa
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80), // cách đáy 80px
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "My App",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
