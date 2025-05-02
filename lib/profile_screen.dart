import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[50],
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.brown[800]),
            SizedBox(height: 24),
            Text(
              'Profil Pengguna',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nama : I Made Dharma Putra'),
            Text('Nomor Telepon : +6281234567890'),
            Text('Alamat: Jl. Raya Kakao No. 123, Denpasar'),
            Text('Email: tempmail@email.com'),
            // Tambahkan lebih banyak data profil sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
