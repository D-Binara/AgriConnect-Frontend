import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Cart items list with mutable quantity
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Tomatoes',
      'imagePath': 'assets/tomatoes.png',
      'price': 100.63,
      'quantity': 2
    },
    {
      'name': 'Onion',
      'imagePath': 'assets/onions.png',
      'price': 150.02,
      'quantity': 3
    },
  ];

  // Method to calculate total price
  double _calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item['price'] * item['quantity'];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Cart'),
        ),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return _buildCartItem(
                    index,
                    item['name'],
                    item['imagePath'],
                    item['price'],
                    item['quantity'],
                  );
                },
              ),
            ),
            Divider(),
            _buildTotalPrice(),
            const SizedBox(height: 20),
            _buildCheckoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
      int index, String name, String imagePath, double price, int quantity) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (cartItems[index]['quantity'] > 1) {
                    cartItems[index]['quantity']--;
                  }
                });
              },
            ),
            Text('${cartItems[index]['quantity']} kg'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  cartItems[index]['quantity']++;
                });
              },
            ),
          ],
        ),
        trailing: Text('\RS ${(price * quantity).toStringAsFixed(2)}'),
      ),
    );
  }

  Widget _buildTotalPrice() {
    double totalPrice = _calculateTotalPrice();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\RS.${totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle checkout logic
        },
        child: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor: Colors.teal,
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
