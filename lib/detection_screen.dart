import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'result_screen.dart';
import 'homepage.dart'; // Untuk navigasi ke homepage dan profile tab

class DetectionScreen extends StatefulWidget {
  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _image;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/best_float16.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> handleDetection() async {
    if (_image == null) return;

    final List? recognitions = await Tflite.detectObjectOnImage(
      path: _image!.path,
      model: "YOLO",
      imageMean: 0,
      imageStd: 255.0,
      threshold: 0.4,
      numResultsPerClass: 1,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      final topDetection = recognitions.first;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            image: _image!,
            label: topDetection['detectedClass'],
            confidence: topDetection['confidenceInClass'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Tidak ada objek terdeteksi.")),
      );
    }
  }

  Future<void> pickFromGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  Future<void> pickFromCamera() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  Widget buildImageSection() {
    return _image == null
        ? Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Silakan pilih atau ambil gambar terlebih dahulu",
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )
        : Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(_image!, height: 300, fit: BoxFit.cover),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Deteksi Penyakit Kakao"),
        backgroundColor: Colors.brown[800],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          buildImageSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: pickFromCamera,
                  icon: Icon(Icons.camera_alt),
                  label: Text("Ambil dari Kamera"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[800],
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: pickFromGallery,
                  icon: Icon(Icons.folder),
                  label: Text("Pilih dari File Perangkat"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _image != null ? handleDetection : null,
                  icon: Icon(Icons.search),
                  label: Text("Mulai Deteksi"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
