// lib/widgets/custom_navbar.dart
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.black, // Set the background color to black
      selectedItemColor: Colors.grey[800], // Set selected item color to white for contrast
      unselectedItemColor: Colors.black, // Set unselected item color for visibility
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videocam_outlined),
          label: 'Video',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outline),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}

class CategoryChips extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  Widget _buildCategoryChip(String label, IconData icon, Color selectedColor) {
    return ChoiceChip(
      label: Row(
        children: [
          Icon(icon, color: selectedCategory == label ? Colors.white : Colors.black),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(color: selectedCategory == label ? Colors.white : Colors.black),
          ),
        ],
      ),
      selected: selectedCategory == label,
      backgroundColor: Colors.grey[800],
      selectedColor: selectedColor,
      onSelected: (bool selected) {
        if (selected) onCategorySelected(label);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryChip('My feed', Icons.flash_on, Colors.redAccent),
        const SizedBox(width: 8),
        _buildCategoryChip('Food', Icons.restaurant, Colors.brown[700]!),
        const SizedBox(width: 8),
        _buildCategoryChip('Concerts', Icons.music_note, Colors.brown[700]!),
      ],
    );
  }
}
