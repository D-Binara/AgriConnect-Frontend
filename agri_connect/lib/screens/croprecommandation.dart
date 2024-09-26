import 'package:agri_connect/services/crop_recommendation_service.dart';
import 'package:flutter/material.dart';
import 'crop_result_page.dart';

class Croprecommandation extends StatefulWidget {
  @override
  _CroprecommandationState createState() => _CroprecommandationState();
}

class _CroprecommandationState extends State<Croprecommandation> {
  final TextEditingController _nitrogenController = TextEditingController();
  final TextEditingController _phosphorusController = TextEditingController();
  final TextEditingController _potassiumController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _rainfallController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitRecommendation() async {
    setState(() {
      _isLoading = true;
    });

    final nitrogen = double.tryParse(_nitrogenController.text) ?? 0;
    final phosphorus = double.tryParse(_phosphorusController.text) ?? 0;
    final potassium = double.tryParse(_potassiumController.text) ?? 0;
    final temperature = double.tryParse(_temperatureController.text) ?? 0;
    final humidity = double.tryParse(_humidityController.text) ?? 0;
    final ph = double.tryParse(_phController.text) ?? 0;
    final rainfall = double.tryParse(_rainfallController.text) ?? 0;

    final response = await CropRecommendationService.getRecommendation(
      nitrogen: nitrogen,
      phosphorus: phosphorus,
      potassium: potassium,
      temperature: temperature,
      humidity: humidity,
      ph: ph,
      rainfall: rainfall,
    );

    setState(() {
      _isLoading = false;
    });

    if (response != null && response.containsKey('recommended crop')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CropResultPage(
            crop: response['recommended crop'],
          ),
        ),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Failed to get crop recommendation. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Recommandation'),
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
              const Text(
                'Welcome To Our Crop Recommendation Feature',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Get personalized crop recommendations based on your location, soil, and climate.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              _buildInputField('Nitrogen', _nitrogenController),
              _buildInputField('Phosphorus', _phosphorusController),
              _buildInputField('Potassium', _potassiumController),
              _buildInputField('Average Temperature', _temperatureController),
              _buildInputField('Average Humidity', _humidityController),
              _buildInputField('PH Level', _phController),
              _buildInputField('Rainfall', _rainfallController),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitRecommendation,
                child: const Text(
                  'Predict',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
