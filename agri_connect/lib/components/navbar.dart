import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insights),
          label: 'Prediction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.batch_prediction),
          label: 'Diseases',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Market',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.teal[700], // Darker teal for selected item
      unselectedItemColor: Colors.grey[600], // Darker grey for unselected items
      backgroundColor: Colors.lightGreen[50], // Lighter background
      showUnselectedLabels: false, // Show labels for unselected items
      type: BottomNavigationBarType.fixed, // Fixed type for better performance
      elevation: 8, // Adding elevation for shadow effect
      selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.bold), // Bold text for selected item
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal), // Normal text for unselected items
      iconSize: 24, // Increased icon size
    );
  }
}
