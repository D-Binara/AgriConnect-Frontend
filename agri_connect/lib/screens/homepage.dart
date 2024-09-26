import 'package:agri_connect/screens/market.dart';
import 'package:agri_connect/services/crop_recommendation_service.dart';
import 'package:flutter/material.dart';
import 'package:agri_connect/screens/cart_page.dart';
import 'package:agri_connect/components/navbar.dart';
import 'package:agri_connect/screens/croprecommandation.dart';
import 'package:agri_connect/screens/predictionpage.dart';
import 'package:agri_connect/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages corresponding to the tabs
  final List<Widget> _pages = [
    HomePageContent(), // You need to split HomePage content into a separate widget
    Croprecommandation(),
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

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatic page change for carousel
    Future.delayed(Duration(seconds: 1)).then((_) {
      _pageController.animateToPage(
        (_currentPage + 1) % 3,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
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
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildCarouselItem(
                      context,
                      '',
                      'assets/Frame 2424.png',
                    ),
                    _buildCarouselItem(
                      context,
                      '',
                      'assets/Frame 2425.png', // Change to different image if available
                    ),
                    _buildCarouselItem(
                      context,
                      '',
                      'assets/Frame 2427.png', // Change to different image if available
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
                'Explore',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 2, 173, 112),
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
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            // Product Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${price.toStringAsFixed(2)}/Kg',
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add to cart functionality here
                  // e.g., call a function to add the product to the cart
                  print('$name added to cart');
                },
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                label: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
