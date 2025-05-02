import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yolo_app/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.brown[800],
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gambar logo dari assets
          Image.asset(
            'assets/images/logo_kokoa.png',  // Ganti dengan nama file logomu
            width: 120,
            height: 120,
          ),
          SizedBox(height: 20), // Jarak antara logo dan teks
          Text(
            'Aplikasi Deteksi Penyakit Kakao',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

}
