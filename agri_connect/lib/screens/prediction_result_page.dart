import 'package:flutter/material.dart';

class PredictionResultPage extends StatelessWidget {
  final String disease;
  final double confidence;
  final String solution;

  PredictionResultPage({
    required this.disease,
    required this.confidence,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    // Clean up the solution string by removing unwanted characters
    String cleanedSolution = solution.replaceAll('\\n', '\n');

    // Format text using different fonts for Sinhala, Tamil, and default (English)
    List<TextSpan> _formatText(String text) {
      List<TextSpan> spans = [];
      final RegExp regExp = RegExp(r"(\*\*.*?\*\*|\*.*?\*|DISEASE:.*Sinhala.*|DISEASE:.*Tamil.*)");

      int start = 0;
      for (var match in regExp.allMatches(text)) {
        if (match.start > start) {
          // Add normal text
          spans.add(TextSpan(text: text.substring(start, match.start)));
        }

        String matchText = match.group(0)!;

        if (matchText.startsWith('**')) {
          // Add bold text
          spans.add(
            TextSpan(
              text: matchText.substring(2, matchText.length - 2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else if (matchText.startsWith('*')) {
          // Add italic text
          spans.add(
            TextSpan(
              text: matchText.substring(1, matchText.length - 1),
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          );
        } else if (matchText.contains('Sinhala')) {
          // Add Sinhala text with proper font
          spans.add(
            TextSpan(
              text: matchText,
              style: const TextStyle(fontFamily: 'NotoSansSinhala'),
            ),
          );
        } else if (matchText.contains('Tamil')) {
          // Add Tamil text with proper font
          spans.add(
            TextSpan(
              text: matchText,
              style: const TextStyle(fontFamily: 'NotoSansTamil'),
            ),
          );
        }

        start = match.end;
      }

      if (start < text.length) {
        // Add remaining normal text
        spans.add(TextSpan(text: text.substring(start)));
      }

      return spans;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Prediction Result'),
        ),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Disease Identified: $disease',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Confidence: $confidence %',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'Suggested Solution:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: _formatText(cleanedSolution), // Apply fonts
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to home page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Go to Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
