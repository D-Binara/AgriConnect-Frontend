import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PredictionService {
  static const String apiUrl = 'http://13.53.54.49:8000/prediction';

  static Future<Map<String, dynamic>?> predictDisease(XFile image) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('imageFile', image.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        return jsonDecode(responseData.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Error predicting disease: $e');
      return null;
    }
  }
}
