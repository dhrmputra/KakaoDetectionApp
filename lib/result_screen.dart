import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final File image;
  final String label;
  final double confidence;

  const ResultScreen({
    required this.image,
    required this.label,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Hasil Deteksi"),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(image, height: 250),
            ),
            SizedBox(height: 24),
            Text(
              "Jenis: $label",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown[900]),
            ),
            SizedBox(height: 12),
            Text(
              "Confidence: ${(confidence * 100).toStringAsFixed(2)}%",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Deteksi Lagi"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[700],
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
