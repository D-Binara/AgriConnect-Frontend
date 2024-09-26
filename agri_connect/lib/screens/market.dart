import 'package:flutter/material.dart';

class MarketplacePage extends StatefulWidget {
  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final List<Product> products = [
    Product(
      name: 'Tomatoes',
      imagePath: 'assets/tomatoes.png',
      price: 4.63,
    ),
    Product(
      name: 'Onions',
      imagePath: 'assets/onions.png',
      price: 3.02,
    ),
    Product(
      name: 'Guava',
      imagePath: 'assets/pera.jpg',
      price: 2.50,
    ),
    Product(
      name: 'Carrots',
      imagePath: 'assets/carrot.webp',
      price: 1.80,
    ),
  ];

  List<Product> filteredProducts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initially show all products
  }

  void _filterProducts(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchQuery = query;
        filteredProducts = products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        searchQuery = '';
        filteredProducts = products;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: _filterProducts,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10), // Space between search bar and grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7, // Adjusted to fit new image ratio
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(filteredProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              product.imagePath,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          // Product Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
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
              '\$${product.price.toStringAsFixed(2)}/Kg',
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
                print('${product.name} added to cart');
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
    );
  }
}

class Product {
  final String name;
  final String imagePath;
  final double price;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
  });
}
