import 'package:flutter/material.dart';
import 'detection_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BerandaScreen(),
    DetectionScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Mulai Deteksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[50],
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_kokoa.png', width: 120),
            SizedBox(height: 24),
            Text(
              'Selamat Datang di Aplikasi Deteksi Penyakit Buah Kakao',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown[900]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Gunakan fitur deteksi untuk mengidentifikasi kondisi buah kakao Anda dengan cepat dan akurat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
