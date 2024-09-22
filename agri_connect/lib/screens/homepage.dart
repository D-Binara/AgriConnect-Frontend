import 'package:agri_connect/screens/cart_page.dart';
import 'package:agri_connect/components/navbar.dart';
import 'package:agri_connect/screens/profile_page.dart';
import 'package:agri_connect/screens/predictionpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages corresponding to the tabs
  final List<Widget> _pages = [
    HomePageContent(), // You need to split HomePage content into a separate widget
    PredictionPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Home'),
        ),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Adventure Begin Here
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/adventure_background.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        'Adventure Begin Here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Buy Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Featured Products
              const Text(
                'Featured Product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  _buildProductCard('Tomatoes', 'assets/tomatoes.png', 4.63),
                  _buildProductCard('Onion', 'assets/onions.png', 3.02),
                ],
              ),
              const SizedBox(height: 20),
              // Services
              const Text(
                'Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  _buildServiceButton('Prediction'),
                  _buildServiceButton('Seeds'),
                  _buildServiceButton('Workers'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String imagePath, double price) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Image.asset(imagePath, height: 80, fit: BoxFit.cover),
            Text(name),
            Text('\$$price/Kg'),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceButton(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen[100],
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
