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
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87, // đậm dưới
                  Colors.transparent, // nhạt dần lên trên
                ],
              ),
            ),
          ),
          /// Nội dung ở dưới phân nửa
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80), // cách đáy 80px
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "Bắt đầu với những món ăn",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffCEA700),
                      foregroundColor: Colors.white,  // màu chữ + icon
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // bo góc
                      ),
                    ),
                    onPressed: _onClickButton,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Bắt đầu",style: TextStyle(fontSize: 20),),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onClickButton(){
    Navigator.pushReplacementNamed(context, '/main');
  }
}
