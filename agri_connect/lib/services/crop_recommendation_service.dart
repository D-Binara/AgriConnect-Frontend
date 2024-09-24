import 'dart:convert';
import 'package:http/http.dart' as http;

class CropRecommendationService {
  static const String baseUrl = "http://192.168.8.186:8000"; // Replace with your backend URL

  static Future<Map<String, dynamic>?> getRecommendation({
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double temperature,
    required double humidity,
    required double ph,
    required double rainfall,
  }) async {
    // Build the URL with query parameters
    final url = Uri.parse(
        "$baseUrl/crop-recommendation?n=$nitrogen&p=$phosphorus&k=$potassium&temp=$temperature&hum=$humidity&ph=$ph&rf=$rainfall");

    try {
      final response = await http.post(url); 
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Parse the JSON response
      } else {
        print('Failed to fetch recommendation: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
