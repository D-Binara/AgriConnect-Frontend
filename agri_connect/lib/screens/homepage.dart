import 'package:agri_connect/screens/market.dart';
import 'package:flutter/material.dart';
import 'package:agri_connect/screens/cart_page.dart';
import 'package:agri_connect/components/navbar.dart';
import 'package:agri_connect/screens/profile_page.dart';

import 'package:agri_connect/screens/predictionpage.dart';

import 'package:agri_connect/screens/croprecommandation.dart';
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
    PredictionPage(),
    MarketplacePage(),

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
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Carousel for Adventure section
              Container(
                height: 150,
                child: PageView(
                  children: [
                    _buildCarouselItem(
                      context,
                      'Adventure Begin Here',
                      'assets/adventure_background.png',
                    ),
                    _buildCarouselItem(
                      context,
                      'Explore the Unknown',
                      'assets/adventure_background.png', // Change to different image if available
                    ),
                    _buildCarouselItem(
                      context,
                      'Join the Journey',
                      'assets/adventure_background.png', // Change to different image if available
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Featured Products
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Featured Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProductCard('Tomatoes', 'assets/tomatoes.png', 4.63),
                    _buildProductCard('Onion', 'assets/onions.png', 3.02),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Services
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceButton('Prediction'),
                    SizedBox(width: 10),
                    _buildServiceButton('Seeds'),
                    SizedBox(width: 10),
                    _buildServiceButton('Workers'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, String title, String imagePath) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
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
              title,
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
              child: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String imagePath, double price) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$$price/Kg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {},
              ),
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
