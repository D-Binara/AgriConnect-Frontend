import 'package:flutter/material.dart';

class CropResultPage extends StatelessWidget {
  final String crop;

  CropResultPage({required this.crop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Crop'),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Recommended Crop:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              crop,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the home page
              },
              child: const Text(
                'Go to Home',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
